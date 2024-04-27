import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_app_padc/persistance/hive_constants.dart';
part 'otp_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kOTPVO)
class OTPVO{

  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  @JsonKey(name: "email")
  @HiveField(2)
  String? email;

  @JsonKey(name: "phone")
  @HiveField(3)
  String? phone;

  @JsonKey(name: "total_expense")
  @HiveField(4)
  int? totalExpense;

  @JsonKey(name: "profile_image")
  @HiveField(5)
  String? profileImage;


  OTPVO(this.id, this.name, this.email, this.phone, this.totalExpense,
      this.profileImage);

  factory OTPVO.fromJson(Map<String, dynamic> json) => _$OTPVOFromJson(json);

  Map<String, dynamic> toJson() => _$OTPVOToJson(this);

}