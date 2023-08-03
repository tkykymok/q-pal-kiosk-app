import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_pal_kiosk_app/domain/model/reservation.dart';
import 'package:q_pal_kiosk_app/features/reservation_kiosk/reservtion_kiosk_view_model.dart';
import 'package:q_pal_kiosk_app/resources/font_manager.dart';
import 'package:q_pal_kiosk_app/resources/values_manager.dart';

class NextReservationCard extends HookConsumerWidget {
  final WaitingInfo waitingInfo;

  const NextReservationCard({
    super.key,
    required this.waitingInfo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ReservationKioskViewModel viewModel =
        ref.watch(reservationKioskViewModelProvider.notifier);

    return Card(
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
            Text('次の予約番号', style: TextStyle(fontSize: FontSize.s20)),
            SizedBox(height: AppSize.s8),
            Text(
              waitingInfo.reservationNumber.toString(),
              style: TextStyle(
                fontSize: FontSize.s40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSize.s8),
            Text(
              '${waitingInfo.position}番目のご案内です',
              style: TextStyle(fontSize: FontSize.s20),
            ),
            SizedBox(height: AppSize.s4),
            Text(
              '待ち時間目安: ${waitingInfo.time} 分',
              style: TextStyle(
                fontSize: FontSize.s16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: AppSize.s20),
            ElevatedButton(
              onPressed: () => viewModel.createReservation(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Colors.blue[800]), // Set the button color
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      AppSize.s12), // Set the button radius
                )),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p8,
                  bottom: AppPadding.p8,
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                ),
                child: Text('発券する', style: TextStyle(fontSize: FontSize.s20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
