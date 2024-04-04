import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/otp_vo.dart';
part 'get_otp_response.g.dart';

@JsonSerializable()
class GetOTPResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name:"message")
  String? message;

  @JsonKey(name:"data")
  OTPVO? data;

  @JsonKey(name: "token")
  String? token;

  GetOTPResponse({this.code,this.message, this.data,this.token});

  factory GetOTPResponse.fromJson(Map<String, dynamic> json) => _$GetOTPResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOTPResponseToJson(this);
}