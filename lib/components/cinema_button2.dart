
import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class CinemaButton2 extends StatelessWidget {
  final String label;
  final Color bgColor;
  final double borderRadius;
  final void Function()? onPressed;


  const CinemaButton2({
    super.key,
    required this.onPressed,
    required this.label,
    required this.bgColor,
    required this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all( bgColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              // side: const BorderSide(width: 1, color: Color(0xffd9d9d9)),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),

        ),
        child: Text(
          label,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: kDMSansFont,
              fontWeight: FontWeight.bold,
              fontSize: 12),
          textAlign: TextAlign.center,
        ));
  }
}
