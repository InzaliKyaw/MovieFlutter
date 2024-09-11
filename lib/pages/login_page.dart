import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_movie_app_padc/components/cinema_button_icon.dart';
import 'package:the_movie_app_padc/components/cinema_button2.dart';
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/network/api_constants.dart';
import 'package:the_movie_app_padc/pages/otp_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/spaces.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();
  final phController = TextEditingController();

  void initState(){
    super.initState();


  }

  void getOTPFromNetwork(){
    setState(() {
      if(phController.text.isNotEmpty){
        _model.getOTP(phController.text).then((value) {
          if(value.code == 200){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>  OTPPage(phNumber: phController.text,otp: kOtp,)));
          }else{
            Fluttertoast.showToast(msg: value.message ?? "");
          }
        });
      }else{
        Fluttertoast.showToast(msg: "Please enter phone number");
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpacing(48),
              Image.asset(
                "assets/images/logo.png",
                height: kCinemaLogoHeight,
                width: kCinemaLogoWidth,
              ),
              verticalSpacing(48),
              const Text(
                kVerifyYourPhNo,
                style: TextStyle(color: Colors.white, fontSize: kTextRegular4x,
                fontWeight: FontWeight.w500),
              ),
              const Text(
                kVerifyDescription,
                style: TextStyle(color: Colors.grey, fontSize: kTextRegular),
              ),
              verticalSpacing(80),
              Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 24.0),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                    /// Country Ph No. Drop Down
                   ///  Disappear underline Custom with Column
                     Container(
                         decoration: const BoxDecoration(
                           border: Border(
                             bottom: BorderSide(width: 1.5, color: Colors.grey),
                           ),
                         ),
                         height: 48,
                         child: const CustomDropDownButton()),
                    /// Phone No. Text Field
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Container(
                          height: 48,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1.5, color: Colors.grey),
                              ),
                            ),
                          child: TextFormField(
                            controller: phController,
                            style: const TextStyle(
                              color: Colors.white
                            ),
                            decoration:  const InputDecoration(

                              hintText: kMobileNo,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.grey
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                                     ],
                                   ),
                 ),
               /// Verify Phone No. Button
               Padding(
                 padding: const EdgeInsets.only(left: 24.0,right: 24.0, top: 48.0),
                 child: Container(
                   height: 48,
                   width: MediaQuery.of(context).size.width,
                   child: CinemaButton2(
                     onPressed: (){
                       getOTPFromNetwork();
                     },
                     borderRadius: 15.0,
                     label: kVerifyYourPhNo,
                     bgColor: kPrimaryColor,
                   ),
                 ),
               ),
              verticalSpacing(14),
              /// OR label
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Container(
                      width: 100,
                      child: const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                    ),
                  ),
                  const Text(
                    "or",
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Container(
                      width: 100,
                      child: const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpacing(14),
               /// Google Button
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  child: CinemaButtonIcon(
                    onPressed: (){
                      getOTPFromNetwork();
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPPage()));
                    },
                    img: kGoogleLogo,
                    label: kContinueGoogle,
                    bgColor: Colors.white,
                  ),
                ),
              ),
              // /// Terms and Condition
              // const Text(kTermsAndCondition,
              //   style: TextStyle(
              //       color: Colors.grey
              //   ),)
            ],
          ),
        ),
      ),
    );
  }
}

///DropDown button
class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  var dropDownItems = ["+61", "+95", "+66"];
  var selectedItem = "";

  /// Model
  final MovieBookingModel _model = MovieBookingModel();


  @override
  void initState() {
    super.initState();
    selectedItem = dropDownItems.first;

  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
          value: selectedItem,
          items: dropDownItems
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item, style: const TextStyle(color: Colors.grey)),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedItem = value ?? "";
            });
          }),
    );
  }
}
