import 'package:flutter/material.dart';

class CinemaButtonIcon extends StatelessWidget {
  final void Function()? onPressed;
  final String img;
  final String label;
  final Color bgColor;

  const CinemaButtonIcon({
    super.key,
    this.onPressed,
    required this.img,
    required this.label,
    required this.bgColor
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
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.fill),
                ),
              ),
            ),
             Text(
              label,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
