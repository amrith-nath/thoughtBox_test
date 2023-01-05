import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thoughtbox_test/core/color/colors.dart';

class GoogleFont {
  static TextStyle splashTestStyle = GoogleFonts.poppins(
    fontSize: 34,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headTextStyle = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static TextStyle subTextStyle = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static TextStyle buttonTextStyle = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textButtonTextStyle = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: primaryColor,
  );
  static TextStyle subTextSmallStyle = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle inputTextStyle = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle appbarTextStyle = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle listTileTextStyle = GoogleFonts.montserrat(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
}
