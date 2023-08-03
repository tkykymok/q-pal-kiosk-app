// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReservationResponse _$GetReservationResponseFromJson(
        Map<String, dynamic> json) =>
    GetReservationResponse(
      reservationId: json['reservationId'] as int,
      customerId: json['customerId'] as int,
      storeId: json['storeId'] as int,
      staffId: json['staffId'] as int?,
      reservationNumber: json['reservationNumber'] as int,
      reservedDatetime: json['reservedDatetime'] as String,
      holdStartDatetime: json['holdStartDatetime'] as String,
      serviceStartDatetime: json['serviceStartDatetime'] as String,
      serviceEndDatetime: json['serviceEndDatetime'] as String,
      status: json['status'] as String,
      arrivalFlag: json['arrivalFlag'] as bool,
      cancelType: json['cancelType'] as int?,
    );

Map<String, dynamic> _$GetReservationResponseToJson(
        GetReservationResponse instance) =>
    <String, dynamic>{
      'reservationId': instance.reservationId,
      'customerId': instance.customerId,
      'storeId': instance.storeId,
      'staffId': instance.staffId,
      'reservationNumber': instance.reservationNumber,
      'reservedDatetime': instance.reservedDatetime,
      'holdStartDatetime': instance.holdStartDatetime,
      'serviceStartDatetime': instance.serviceStartDatetime,
      'serviceEndDatetime': instance.serviceEndDatetime,
      'status': instance.status,
      'arrivalFlag': instance.arrivalFlag,
      'cancelType': instance.cancelType,
    };
