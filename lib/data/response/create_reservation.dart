import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_reservation.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T extends dynamic> {
  @JsonKey(name: "data")
  T? data;

  @JsonKey(name: "messages")
  List<String>? messages;

  BaseResponse(this.data, this.messages);

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  // Provide a method to convert 'T' to JSON.
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}

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
