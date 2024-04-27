import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

class CustomTimeslotVO{
  String date = "";
  Color? currentColor;

  CustomTimeslotVO(String formattedDate, Color kWhite);
}