class Reservation {
  final int reservationId;
  final int customerId;
  final int storeId;
  final int? staffId;
  final int reservationNumber;
  final String reservedDatetime;
  final String holdStartDatetime;
  final String serviceStartDatetime;
  final String serviceEndDatetime;
  final String status;
  final bool arrivalFlag;
  final int? cancelType;

  Reservation({
    required this.reservationId,
    required this.customerId,
    required this.storeId,
    this.staffId,
    required this.reservationNumber,
    required this.reservedDatetime,
    required this.holdStartDatetime,
    required this.serviceStartDatetime,
    required this.serviceEndDatetime,
    required this.status,
    required this.arrivalFlag,
    this.cancelType,
  });
}

class WaitingInfo {
  final int reservationNumber;
  final int position;
  final int time;

  WaitingInfo({
    required this.reservationNumber,
    required this.position,
    required this.time,
  });

  // Add an empty constructor for the initial state.
  WaitingInfo.empty()
      : reservationNumber = 0,
        position = 0,
        time = 0;
}

class CreatedReservation {
  int reservationNumber;
  String content;

  CreatedReservation(this.reservationNumber, this.content);
}
