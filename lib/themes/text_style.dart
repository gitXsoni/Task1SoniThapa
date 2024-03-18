import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task1/themes/app_color.dart';

class MyTextStyles {
  static final TextStyle headerStyle = GoogleFonts.lora(
      textStyle: TextStyle(
    fontSize: 20,
    color: AppColor.primaryColor,
    fontWeight: FontWeight.w500,
  ));
  static final TextStyle titleStyle = GoogleFonts.inter(
      textStyle: TextStyle(
    fontSize: 16,
    color: AppColor.primaryColor,
    fontWeight: FontWeight.w800,
  ));
  static final TextStyle normalTextStyle = GoogleFonts.inter(
      textStyle: TextStyle(
    fontSize: 12,
    color: AppColor.secondaryColor,
    fontWeight: FontWeight.w400,
  ));
}
