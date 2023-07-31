import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_pal_kiosk_app/app/providers.dart';
import 'package:q_pal_kiosk_app/domain/model/reservation.dart';
import 'package:q_pal_kiosk_app/domain/usecase/reservation_kiosk/create_reservation_usecase.dart';
import 'package:q_pal_kiosk_app/features/reservation_kiosk/reservation_kiosk_state.dart';

class ReservationKioskViewModel extends StateNotifier<ReservationKioskState> {
  final Ref _ref;
  ReservationKioskViewModel(this._ref)
      : super(ReservationKioskState(
          reservations: [],
          waitingInfo: WaitingInfo.empty(),
        ));

  createReservation() async {
    debugPrint("入ってる");
    final createReservationUseCase =
        await _ref.read(createReservationUseCaseProvider.future);

    (await createReservationUseCase.execute(2)).fold(
      (failure) {
        // left -> failure
      },
      (data) {
        // right -> success
        debugPrint("成功しました");
        debugPrint(data.content);
      },
    );
  }
}

final reservationKioskViewModelProvider = StateNotifierProvider.autoDispose<
    ReservationKioskViewModel, ReservationKioskState>((ref) {
  return ReservationKioskViewModel(ref);
});
