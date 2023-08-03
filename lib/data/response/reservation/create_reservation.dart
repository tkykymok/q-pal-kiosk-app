import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_reservation.g.dart';

@JsonSerializable()
class CreateReservationResponse {
  @JsonKey(name: "reservationNumber")
  int reservationNumber;

  @JsonKey(name: "content")
  String content;

  CreateReservationResponse(
    this.reservationNumber,
    this.content,
  );

  factory CreateReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateReservationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateReservationResponseToJson(this);
}
