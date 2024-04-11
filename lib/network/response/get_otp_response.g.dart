// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_otp_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OTPVOAdapter extends TypeAdapter<GetOTPResponse> {
  @override
  final int typeId = 7;

  @override
  GetOTPResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetOTPResponse(
      code: fields[0] as int?,
      message: fields[1] as String?,
      data: fields[2] as OTPVO?,
      token: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetOTPResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OTPVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOTPResponse _$GetOTPResponseFromJson(Map<String, dynamic> json) =>
    GetOTPResponse(
      code: json['code'] as int?,
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
