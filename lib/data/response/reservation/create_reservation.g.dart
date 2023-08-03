// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
