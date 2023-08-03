import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_response.g.dart';

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
