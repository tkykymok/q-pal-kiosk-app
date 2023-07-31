import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:q_pal_kiosk_app/domain/model/reservation.dart';
import 'package:q_pal_kiosk_app/domain/usecase/reservation_kiosk/create_reservation_usecase.dart';

part 'reservation_kiosk_state.freezed.dart';

@freezed
class ReservationKioskState with _$ReservationKioskState {
  const factory ReservationKioskState({
    required List<Reservation> reservations,
    required WaitingInfo waitingInfo,
  }) = _ReservationKioskState;
}
