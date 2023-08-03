import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:q_pal_kiosk_app/app/enum/card_status.dart';
import 'package:q_pal_kiosk_app/domain/model/reservation.dart';

part 'reservation_kiosk_state.freezed.dart';

@freezed
class ReservationKioskState with _$ReservationKioskState {
  const factory ReservationKioskState({
    // 予約一覧
    required List<Reservation> reservations,
    // 案内待ち情報
    required WaitingInfo waitingInfo,
    // ステータス毎予約一覧Map
    required Map<CardStatus, List<Reservation>> reservationsMap,
    // 発券予約番号
    @Default(0) int reservationNumber,
    // 発券予約情報
    @Default("") String encryptedText,
  }) = _ReservationKioskState;
}
