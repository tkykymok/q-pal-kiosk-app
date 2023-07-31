// to convert to the response into a non nullable object (model)

import 'package:q_pal_kiosk_app/app/extensions.dart';
import 'package:q_pal_kiosk_app/data/response/create_reservation.dart';
import 'package:q_pal_kiosk_app/domain/model/reservation.dart';

const EMPTY = "";
const ZERO = 0;

extension CreateReservationResponseMapper on CreateReservationResponse? {
  CreatedReservation toDomain() {
    return CreatedReservation(
      this?.reservationNumber?.orZero() ?? ZERO,
      this?.content?.orEmpty() ?? EMPTY,
    );
  }
}
