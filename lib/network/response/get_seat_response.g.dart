// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_seat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSeatResponse _$GetSeatResponseFromJson(Map<String, dynamic> json) =>
    GetSeatResponse(
      (json['code'] as num?)?.toInt(),
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
              .map((e) => SeatPlanVO.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$GetSeatResponseToJson(GetSeatResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.seatPlanList,
    };
