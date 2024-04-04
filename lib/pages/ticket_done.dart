import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/components/cinema_button2.dart';
import 'package:the_movie_app_padc/components/ticket_item_view.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class TicketDone extends StatefulWidget {
  const TicketDone({Key? key}) : super(key: key);

  @override
  State<TicketDone> createState() => _TicketDoneState();
}

class _TicketDoneState extends State<TicketDone> {
  bool showBookingSuccess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey2,
      body: SafeArea(
        child: Stack(
          children: [
            ///The whole Page
            Column(
              children: [
            /// App Bar
            Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kMarginLarge, vertical: kMarginMedium),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: kMarginLarge,
                        ),
                      ),
                      const Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            kTicketInformation,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ///Gradient Container Ticket Info
            Padding(
            padding: const EdgeInsets.all(kMarginMedium3),
            child: TicketItemView(onTap: (){

            },)),
            /// Qr and Text
            Image.asset(kQrImg,
            height: 100,
            width: 80,),
            const Text(kQrSample,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),),
            RichText(text: const TextSpan(
              text: kTpin,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
              ),
              children: [
                TextSpan(text: kQrSample2,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    )
                )
              ]

            )),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                width: 200,
                child: CinemaButton2(onPressed: (){
                   setState(() {
                     showBookingSuccess = true;
                   });
                   Future.delayed(const Duration(seconds: 3), () {
                     setState(() {
                       showBookingSuccess = false;
                     });
                   });
                }, label: kDone, bgColor: kPrimaryColor, borderRadius: 5.0),
              ),
            )
              ],
            ),
            /// Congratulation Image
            Visibility(
              visible: showBookingSuccess,
              child: Positioned.fill(child:
              Container(
                color: const Color.fromRGBO(0, 0, 0, 9.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(kBookingSuccessImg)),
              ),

              ),
            )

          ],
           
        ),
      ),
    );
  }
}

