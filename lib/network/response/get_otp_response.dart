import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/otp_vo.dart';
import '../../persistance/hive_constants.dart';
part 'get_otp_response.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIdOTPVO,adapterName: kAdapterNameOTPVO)
class GetOTPResponse{

  @JsonKey(name: "code")
  @HiveField(0)
  int? code;

  @JsonKey(name:"message")
  @HiveField(1)
  String? message;

  @JsonKey(name:"data")
  @HiveField(2)
  OTPVO? data;

  @JsonKey(name: "token")
  @HiveField(3)
  String? token;

  GetOTPResponse({this.code,this.message, this.data,this.token});

  factory GetOTPResponse.fromJson(Map<String, dynamic> json) => _$GetOTPResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOTPResponseToJson(this);
}