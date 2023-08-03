import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_pal_kiosk_app/app/constant.dart';
import 'package:q_pal_kiosk_app/app/enum/card_status.dart';
import 'package:q_pal_kiosk_app/app/providers.dart';
import 'package:q_pal_kiosk_app/domain/model/reservation.dart';
import 'package:q_pal_kiosk_app/features/reservation_kiosk/reservation_kiosk_state.dart';
import 'package:q_pal_kiosk_app/resources/strings_manager.dart';

class ReservationKioskViewModel extends StateNotifier<ReservationKioskState> {
  final Ref _ref;
  WebSocket? _webSocket;
  ReservationKioskViewModel(this._ref)
      : super(ReservationKioskState(
            reservations: [],
            waitingInfo: WaitingInfo.empty(),
            reservationsMap: <CardStatus, List<Reservation>>{}));

  // 予約一覧
  List<Reservation> get reservations => state.reservations;
  // ステータス毎予約一覧Map
  Map<CardStatus, List<Reservation>> get reservationsMap =>
      state.reservationsMap;
  // 案内待ち情報
  WaitingInfo get waitingInfo => state.waitingInfo;
  // 発券予約番号
  get reservationNumber => state.reservationNumber;
  // 予約確認URL
  get myReservationUrl =>
      '${Constant.BASE_WEB_URL}my-reservation?data=${state.encryptedText}';

  /// 今日の予約一覧を取得する
  Future<void> getReservations() async {
    final getReservationsUseCase =
        await _ref.read(getReservationsUseCaseProvider.future);

    (await getReservationsUseCase.execute(null)).fold(
      (failure) {
        // left -> failure
      },
      (data) {
        // right -> success
        // Create a new list instance with the new reservations
        final List<Reservation> newReservations = List.from(data);
        final newReservationsMap = newReservations
            .fold(<CardStatus, List<Reservation>>{}, (map, reservation) {
          final status = getCardStatus(reservation.status);
          final statusGroup = map[status] ?? [];
          statusGroup.add(reservation);
          map[status] = statusGroup;
          return map;
        });

        state = state.copyWith(
          reservations: newReservations,
          reservationsMap: newReservationsMap,
        );
      },
    );
  }

  /// 案内待ち情報を取得する
  Future<void> getWaitingInfo() async {
    final getWaitingInfoUseCase =
        await _ref.read(getWaitingInfoUseCaseProvider.future);

    (await getWaitingInfoUseCase.execute(null)).fold(
      (failure) {
        // left -> failure
      },
      (data) {
        // right -> success
        state = state.copyWith(
          waitingInfo: data,
        );
      },
    );
  }

  /// 発券する(予約登録)
  Future<void> createReservation() async {
    final createReservationUseCase =
        await _ref.read(createReservationUseCaseProvider.future);

    final result = await createReservationUseCase.execute(2);

    return result.fold(
      (failure) {
        // left -> failure
        // ここでエラーを適切に処理し、適切なCreatedReservationオブジェクトを返すか、またはエラーをスローします。
        return Future.error(Exception(AppStrings.failedCreateReservation));
      },
      (data) {
        // right -> success
        state = state.copyWith(
          reservationNumber: data.reservationNumber,
          encryptedText: data.content,
        );
        return Future.value();
      },
    );
  }

  /// WebSocketの接続をOpenする
  Future<void> openWebSocket(String url) async {
    _webSocket = await WebSocket.connect(url);

    _webSocket!.listen(
      (data) {
        // メッセージを解析します
        Map<String, dynamic> message = jsonDecode(data);
        if (message['message'] == AppStrings.reservationCreated) {
          getReservations();
          getWaitingInfo();
        }
        // 他のメッセージに対するアクションもここに追加できます
      },
      onDone: () {
        // Handle connection closed
      },
      onError: (error) {
        // Handle error
      },
    );
  }

  /// WebSocketの接続をCloseする
  Future<void> closeWebSocket() async {
    await _webSocket?.close();
  }
}

final reservationKioskViewModelProvider = StateNotifierProvider.autoDispose<
    ReservationKioskViewModel, ReservationKioskState>((ref) {
  return ReservationKioskViewModel(ref);
});
