// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T extends dynamic>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      _$nullableGenericFromJson(json['data'], fromJsonT),
      (json['messages'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BaseResponseToJson<T extends dynamic>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'messages': instance.messages,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

CreateReservationResponse _$CreateReservationResponseFromJson(
        Map<String, dynamic> json) =>
    CreateReservationResponse(
      json['reservationNumber'] as int,
      json['content'] as String,
    );

Map<String, dynamic> _$CreateReservationResponseToJson(
        CreateReservationResponse instance) =>
    <String, dynamic>{
      'reservationNumber': instance.reservationNumber,
      'content': instance.content,
    };
