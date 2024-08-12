// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOTPResponse _$GetOTPResponseFromJson(Map<String, dynamic> json) =>
    GetOTPResponse(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : OTPVO.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$GetOTPResponseToJson(GetOTPResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'token': instance.token,
    };
