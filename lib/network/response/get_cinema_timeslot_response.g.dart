// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cinema_timeslot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCinemaDayTimeSlotResponse _$GetCinemaDayTimeSlotResponseFromJson(
        Map<String, dynamic> json) =>
    GetCinemaDayTimeSlotResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CinemaTimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCinemaDayTimeSlotResponseToJson(
        GetCinemaDayTimeSlotResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
