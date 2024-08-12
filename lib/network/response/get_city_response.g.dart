// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_city_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCityResponse _$GetCityResponseFromJson(Map<String, dynamic> json) =>
    GetCityResponse(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      cities: (json['data'] as List<dynamic>?)
          ?.map((e) => CityVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCityResponseToJson(GetCityResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.cities,
    };
