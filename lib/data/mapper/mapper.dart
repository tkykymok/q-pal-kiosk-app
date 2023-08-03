// to convert to the response into a non nullable object (model)
// ignore_for_file: constant_identifier_names

import 'package:q_pal_kiosk_app/app/extensions.dart';
import 'package:q_pal_kiosk_app/data/response/reservation/create_reservation.dart';
import 'package:q_pal_kiosk_app/data/response/reservation/get_reservation.dart';
import 'package:q_pal_kiosk_app/data/response/reservation/get_waiting_info.dart';
import 'package:q_pal_kiosk_app/domain/model/reservation.dart';

const EMPTY = "";
const ZERO = 0;

extension CreateReservationResponseMapper on CreateReservationResponse? {
  CreatedReservation toDomain() {
    return CreatedReservation(
      reservationNumber: this?.reservationNumber.orZero() ?? ZERO,
      content: this?.content.orEmpty() ?? EMPTY,
    );
  }
}

extension GetReservationResponseMapper on GetReservationResponse? {
  Reservation toDomain() {
    return Reservation(
      reservationId: this?.reservationNumber.orZero() ?? ZERO,
      customerId: this?.customerId.orZero() ?? ZERO,
      storeId: this?.storeId.orZero() ?? ZERO,
      staffId: this?.staffId.orZero() ?? ZERO,
      reservationNumber: this?.reservationNumber.orZero() ?? ZERO,
      reservedDatetime: this?.reservedDatetime.orEmpty() ?? EMPTY,
      holdStartDatetime: this?.holdStartDatetime.orEmpty() ?? EMPTY,
      serviceStartDatetime: this?.serviceStartDatetime.orEmpty() ?? EMPTY,
      serviceEndDatetime: this?.serviceEndDatetime.orEmpty() ?? EMPTY,
      status: this?.status.orEmpty() ?? EMPTY,
      arrivalFlag: this?.arrivalFlag ?? false,
      cancelType: this?.cancelType?.orZero() ?? ZERO,
    );
  }
}

extension GetWaitingInfoResponseMapper on GetWaitingInfoResponse? {
  WaitingInfo toDomain() {
    return WaitingInfo(
      reservationNumber: this?.reservationNumber.orZero() ?? ZERO,
      position: this?.position.orZero() ?? ZERO,
      time: this?.time.orZero() ?? ZERO,
    );
  }
}
