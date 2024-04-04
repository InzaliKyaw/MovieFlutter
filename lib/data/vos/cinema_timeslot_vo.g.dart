// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_timeslot_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaTimeSlot _$CinemaTimeSlotFromJson(Map<String, dynamic> json) =>
    CinemaTimeSlot(
      json['cinema_id'] as int?,
      json['cinema'] as String?,
      (json['timeslots'] as List<dynamic>?)
          ?.map((e) => TimeslotVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CinemaTimeSlotToJson(CinemaTimeSlot instance) =>
    <String, dynamic>{
      'cinema_id': instance.cinemaId,
      'cinema': instance.cinema,
      'timeslots': instance.timeslot,
    };
