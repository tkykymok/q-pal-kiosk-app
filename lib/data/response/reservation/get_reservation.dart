import 'package:json_annotation/json_annotation.dart';
part 'get_reservation.g.dart';

@JsonSerializable()
class GetReservationResponse {
  @JsonKey(name: "reservationId")
  final int reservationId;
  @JsonKey(name: "customerId")
  final int customerId;
  @JsonKey(name: "storeId")
  final int storeId;
  @JsonKey(name: "staffId")
  final int? staffId;
  @JsonKey(name: "reservationNumber")
  final int reservationNumber;
  @JsonKey(name: "reservedDatetime")
  final String reservedDatetime;
  @JsonKey(name: "holdStartDatetime")
  final String holdStartDatetime;
  @JsonKey(name: "serviceStartDatetime")
  final String serviceStartDatetime;
  @JsonKey(name: "serviceEndDatetime")
  final String serviceEndDatetime;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "arrivalFlag")
  final bool arrivalFlag;
  @JsonKey(name: "cancelType")
  final int? cancelType;

  GetReservationResponse({
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

  factory GetReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetReservationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetReservationResponseToJson(this);
}
