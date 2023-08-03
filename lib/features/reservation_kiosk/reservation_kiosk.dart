import 'dart:async';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_pal_kiosk_app/app/constant.dart';
import 'package:q_pal_kiosk_app/app/enum/card_status.dart';
import 'package:q_pal_kiosk_app/features/reservation_kiosk/component/guide_card.dart';
import 'package:q_pal_kiosk_app/features/reservation_kiosk/reservtion_kiosk_view_model.dart';
import 'package:q_pal_kiosk_app/resources/font_manager.dart';
import 'package:q_pal_kiosk_app/resources/values_manager.dart';

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReservationKioskView extends HookConsumerWidget {
  const ReservationKioskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrKey = useState(GlobalKey());
    final printerManager = BlueThermalPrinter.instance;

    final state = ref.watch(reservationKioskViewModelProvider);
    final viewModel = ref.watch(reservationKioskViewModelProvider.notifier);

    useEffect(() {
      // WebSocketの接続をOpenする
      viewModel.openWebSocket(
          "${Constant.BASE_WEBSOCKET_URL}/reservation?storeId=2");
      // 予約一覧、案内待ち情報を取得する
      final futureList = <Future>[
        viewModel.getReservations(),
        viewModel.getWaitingInfo(),
      ];
      Future.wait(futureList);

      return () {
        // WebSocketの接続をCloseする
        viewModel.closeWebSocket();
      };
    }, [viewModel]);

    /// QR印刷
    handlePrintQr() {
      // Get boundary reference before async gap
      RenderRepaintBoundary boundary = qrKey.value.currentContext!
          .findRenderObject() as RenderRepaintBoundary;

      scheduleMicrotask(() async {
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);

        ByteData? byteDataMaybe =
            await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteDataMaybe == null) {
          // エラー時の処理
          throw Exception("Failed to convert image to byte data");
        }
        ByteData byteData = byteDataMaybe;
        Uint8List pngBytes = byteData.buffer.asUint8List();

        final dir = await getTemporaryDirectory();
        final path = '${dir.path}/temp_qr.png';
        final file = File(path);
        await file.writeAsBytes(pngBytes);

        // Printerに接続
        List<BluetoothDevice> devices = [];
        await Future.delayed(Duration.zero, () async {
          devices = await printerManager.getBondedDevices();
        });

        BluetoothDevice? printer;
        for (BluetoothDevice device in devices) {
          if (device.name == 'my_printer_name') {
            printer = device;
            break;
          }
        }

        if (printer != null) {
          await printerManager.connect(printer);
          final result = await printerManager.printImage(path);
          print('Print result: $result');
          await printerManager.disconnect();
        }
      });
    }

    /// QRモーダルを表示する
    showFadingModalBottomSheet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (BuildContext context) {
          scheduleMicrotask(() {
            handlePrintQr();
            Navigator.of(context).pop();
          });
          return GestureDetector(
            onTap: () => Navigator.pop(context),
            behavior: HitTestBehavior.opaque,
            child: Stack(
              children: [
                Center(
                  child: FractionalTranslation(
                    translation: const Offset(0, 0),
                    child: SizedBox(
                      width: AppSize.s300,
                      height: AppSize.s400,
                      child: Card(
                        shadowColor: Colors.grey,
                        elevation: AppSize.s4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p12),
                          child: RepaintBoundary(
                            key: qrKey.value,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('予約番号',
                                    style: TextStyle(fontSize: FontSize.s24)),
                                Text(
                                  '${viewModel.reservationNumber}',
                                  style: const TextStyle(
                                    fontSize: FontSize.s40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                QrImageView(
                                  data: viewModel.myReservationUrl,
                                  version: QrVersions.auto,
                                  size: AppSize.s180,
                                ),
                                const Text('QRから案内状況をご確認頂けます',
                                    style: TextStyle(fontSize: FontSize.s16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    /// handleCreateReservation
    handleCreateReservation() async {
      await viewModel.createReservation().catchError((error) {
        // エラーが発生した場合の処理
        print('エラーが発生しました: $error');
      });
      showFadingModalBottomSheet();
    }

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: GuideCard(
                    title: '案内中',
                    color: Colors.green,
                    reservations:
                        state.reservationsMap[CardStatus.IN_PROGRESS] ?? []),
              ),
              Expanded(
                child: GuideCard(
                  title: '保留',
                  color: Colors.grey,
                  reservations: state.reservationsMap[CardStatus.PENDING] ?? [],
                ),
              ),
              Expanded(
                flex: 2,
                child: GuideCard(
                  title: '案内待ち',
                  color: Colors.blue,
                  reservations: state.reservationsMap[CardStatus.WAITING] ?? [],
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shadowColor: Colors.grey,
                  elevation: AppSize.s4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('次の予約番号',
                            style: TextStyle(fontSize: FontSize.s20)),
                        const SizedBox(height: AppSize.s8),
                        Text(
                          state.waitingInfo.reservationNumber.toString(),
                          style: const TextStyle(
                            fontSize: FontSize.s40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppSize.s8),
                        Text(
                          '${state.waitingInfo.position}番目のご案内です',
                          style: const TextStyle(fontSize: FontSize.s20),
                        ),
                        const SizedBox(height: AppSize.s4),
                        Text(
                          '待ち時間目安: ${state.waitingInfo.time} 分',
                          style: const TextStyle(
                            fontSize: FontSize.s16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: AppSize.s20),
                        ElevatedButton(
                          onPressed: () async {
                            handleCreateReservation();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.blue[800],
                            ), // Set the button color
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppSize.s12,
                                ), // Set the button radius
                              ),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              top: AppPadding.p8,
                              bottom: AppPadding.p8,
                              left: AppPadding.p28,
                              right: AppPadding.p28,
                            ),
                            child: Text('発券する',
                                style: TextStyle(fontSize: FontSize.s20)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
