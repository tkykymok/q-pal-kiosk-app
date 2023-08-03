// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_waiting_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWaitingInfoResponse _$GetWaitingInfoResponseFromJson(
        Map<String, dynamic> json) =>
    GetWaitingInfoResponse(
      reservationNumber: json['reservationNumber'] as int,
      position: json['position'] as int,
      time: json['time'] as int,
    );

Map<String, dynamic> _$GetWaitingInfoResponseToJson(
        GetWaitingInfoResponse instance) =>
    <String, dynamic>{
      'reservationNumber': instance.reservationNumber,
      'position': instance.position,
      'time': instance.time,
    };
