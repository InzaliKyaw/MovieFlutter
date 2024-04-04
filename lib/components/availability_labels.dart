import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/utils/colors.dart';

class AvailabilityLabels extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;

  final String secondLabel;
  final String thirdLabel;

   const AvailabilityLabels({
    super.key,
     required this.firstColor,
     required this.secondColor,
     required this.thirdColor,
     required this.secondLabel,
     required this.thirdLabel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGrey2,
      child:  Padding(
        padding: EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.circle,
                    color: firstColor,
                    size: 8,
                  ),
                ),
                Text(
                  "Available",
                  style: TextStyle(color: firstColor, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.circle,
                    color: secondColor,
                    size: 8,
                  ),
                ),
                Text(
                  secondLabel,
                  style:
                  TextStyle(color: secondColor, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.circle,
                    color: thirdColor,
                    size: 8,
                  ),
                ),
                Text(
                  thirdLabel,
                  style: TextStyle(color: thirdColor, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
