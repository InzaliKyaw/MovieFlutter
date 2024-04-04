import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/utils/images.dart';

class CinemaButtonIconCustom extends StatelessWidget {
  final void Function()? onPressed;
  final String img;
  final String label;
  final Color bgColor;
  final double? imgHeight;
  final double? imgWidth;
  final Color txtColor;
  final double? radius;

  const CinemaButtonIconCustom({
    super.key,
    this.onPressed,
    required this.img,
    required this.label,
    required this.bgColor,
    required this.imgHeight,
    required this.imgWidth,
    required this.txtColor,
    required this.radius
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
              borderRadius: BorderRadius.circular(radius!),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Image.asset(img,
              height: imgHeight,
              width: imgWidth,
              color: txtColor,),
            ),
            Text(
              label,
              style: TextStyle(
                  color: txtColor,
                  fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
