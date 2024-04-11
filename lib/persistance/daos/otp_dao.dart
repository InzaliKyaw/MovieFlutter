import 'package:the_movie_app_padc/network/response/get_otp_response.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_movie_app_padc/persistance/hive_constants.dart';


class OTPDao{
  /// Must be Singleton
  static final OTPDao _singleton = OTPDao._internal();

  factory OTPDao(){
    return _singleton;
  }

  OTPDao._internal();

  void saveOTPResponeVO(GetOTPResponse getOTPResponse) async{
    return getOTPBox().put(getOTPResponse.data?.id,getOTPResponse);
  }

  String? getTokenById(int otpId){
    return getOTPBox().get(otpId)?.token;
  }

  Box<GetOTPResponse> getOTPBox(){
    return Hive.box<GetOTPResponse>(kBoxNameOTPVO);
  }

}