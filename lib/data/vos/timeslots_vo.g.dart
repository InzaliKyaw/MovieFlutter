// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeslots_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeslotVO _$TimeslotVOFromJson(Map<String, dynamic> json) => TimeslotVO(
      json['status'] as int?,
      json['start_time'] as String?,
      json['cinema_day_timeslot_id'] as int?,
    );

Map<String, dynamic> _$TimeslotVOToJson(TimeslotVO instance) =>
    <String, dynamic>{
      'cinema_day_timeslot_id': instance.cinemaDayTimeslotId,
      'start_time': instance.startTime,
      'status': instance.status,
    };
