import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';

import '../utils/images.dart';

class TicketButton extends StatelessWidget {
   final String btnText;
   final void Function()? onTap;
   final Color btnColor;
   final Color txtColor;

   const TicketButton({
     super.key,
     required this.btnText,
     required this.onTap,
     required this.btnColor,
    required this.txtColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        height: kBookingButtonHeight,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                  kBookingButtonEnd,
                  color: btnColor,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: kBookingButtonHeight,
                decoration: BoxDecoration(
                    color: btnColor
                ),
                child:  Center(
                  child: Text(
                    btnText,
                    style: TextStyle(
                        color: txtColor,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                  kBookingButtonEnd,
                  color: btnColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
