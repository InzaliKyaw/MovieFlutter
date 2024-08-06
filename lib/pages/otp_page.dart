import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/pages/home_page.dart';
import 'package:the_movie_app_padc/pages/location_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/spaces.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

import '../data/models/movie_booking_model_impl.dart';

class OTPPage extends StatefulWidget {
  final String? phNumber;
  final String? otp;


  const OTPPage({super.key,required this.phNumber,required this.otp});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {

  /// Model
  final MovieBookingModelImpl _model = MovieBookingModelImpl();

  /// OTP Model
  final _pinController = TextEditingController();

  void signInWithPhoneNumber(){
    _model.getCheckOTP(widget.phNumber ?? "", widget.otp ?? "").then((value) {
      if(value.code == 201){
        Fluttertoast.showToast(msg: value.message ?? "");
        saveIdAndToken(value.data?.id ?? 0, value.token ?? "");
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LocationPage(userId: value.data?.id ?? 0 )));
      }else{
        Fluttertoast.showToast(msg: value.message ?? "");
      }
    });
  }

  void saveIdAndToken(int id, String token) async{
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    // Save an integer value to 'num' key.
    await prefs.setInt('id', id);
    await prefs.setString('token', token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App bar
    appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left,
            color: Colors.grey,
          ),
        ),
        backgroundColor: kBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalSpacing(48),
            Image.asset(
              kCinemaLogo,
              height: 200,
              width: 200,
            ),
            verticalSpacing(48),
            const Text(
              kSentOTPCode,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: kTextRegular4x,
                  fontWeight: FontWeight.w500),
            ),
            verticalSpacing(14),
            const Text(
              kOTPDescription,
              style: TextStyle(color: Colors.grey, fontSize: kTextRegular),
              textAlign: TextAlign.center,
            ),
            verticalSpacing(48),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    kEnterOTP,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PinCodeFields(
                length: 6,
                fieldBorderStyle: FieldBorderStyle.square,
                responsive: false,
                fieldHeight: 38.0,
                fieldWidth: 38.0,
                borderWidth: 1.0,
                obscureText: true,
                activeBorderColor: kPrimaryColor,
                activeBackgroundColor:
                const Color.fromRGBO(240, 240, 240, 1.0),
                borderRadius: BorderRadius.circular(5.0),
                keyboardType: TextInputType.number,
                autoHideKeyboard: false,
                fieldBackgroundColor:
                const Color.fromRGBO(240, 240, 240, 1.0),
                borderColor: const Color.fromRGBO(240, 240, 240, 1.0),
                textStyle: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
                onChange: (output) {
                  if (output.length == 6 &&
                      _pinController.text.isNotEmpty) {
                    setState(() {
                    });
                  } else {
                    setState(() {
        
                    });
                  }
                },
                onComplete: (output) {
                  // Your logic with pin code
                  print(output);
                },
              ),
            ),
            verticalSpacing(48),
            RichText(text: const TextSpan(
              children: [
                TextSpan(
                    text: kDonotReceiveOTP,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                    )),
                TextSpan(
                    text: kResendOTP,
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14
                    ))
              ]
            )),
            verticalSpacing(24),
            //To fix with Screen Size
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 24.0),
               child: SizedBox(
                 width: MediaQuery.of(context).size.width,
                 height: 48,
                 child: TextButton(
                     onPressed: (){
                       signInWithPhoneNumber();
                     },
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                       shape: MaterialStateProperty.all(
                         RoundedRectangleBorder(
                           // side: const BorderSide(width: 1, color: Color(0xffd9d9d9)),
                           borderRadius: BorderRadius.circular(5.0),
                         ),
                       ),
        
                     ),
                     child: const Text( 'Confirm OTP',
                       style: TextStyle(
                           color: Colors.black,
                           fontSize: 12),
                       textAlign: TextAlign.center,
                     )),
               ),
             )
          ],
        ),
      ),
    );
  }
}
