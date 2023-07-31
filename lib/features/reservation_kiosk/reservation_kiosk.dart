import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_pal_kiosk_app/features/reservation_kiosk/component/guide_card.dart';
import 'package:q_pal_kiosk_app/features/reservation_kiosk/component/next_reservation_card.dart';
import 'package:q_pal_kiosk_app/features/reservation_kiosk/reservtion_kiosk_view_model.dart';

class ReservationKioskView extends HookConsumerWidget {
  const ReservationKioskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ReservationKioskViewModel viewModel =
        ref.watch(reservationKioskViewModelProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: GuideCard(title: '案内中', color: Colors.green)),
                Expanded(child: GuideCard(title: '保留', color: Colors.grey)),
                Expanded(
                  flex: 2,
                  child: GuideCard(title: '案内待ち', color: Colors.blue),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NextReservationCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
