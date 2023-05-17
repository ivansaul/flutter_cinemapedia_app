import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
    );
  }

  // Colors Primary
  static const Color primaryDark = Color(0xff1F1D2B);
  static const Color primarySoft = Color(0xff252836);
  static const Color primaryBlueAccent = Color(0xff12CDD9);

  // Colors Secondary
  static const Color secondaryGreen = Color(0xff22B07D);
  static const Color secondaryOrange = Color(0xffFF8700);
  static const Color secondaryRed = Color(0xffFF7256);

  // Text Color
  static const Color textColorBlack = Color(0xff171725);
  static const Color textColorDarkGrey = Color(0xff696974);
  static const Color textColorGrey = Color(0xff92929D);
  static const Color textColorWhiteGrey = Color(0xffF1F1F5);
  static const Color textColorWhite = Color(0xffFFFFFF);
  static const Color textColorLineDark = Color(0xffEAEAEA);

  // Heading text style SemiBold
  static TextStyle h1Semibold = GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );
  static TextStyle h2Semibold = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );
  static TextStyle h3Semibold = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );
  static TextStyle h4Semibold = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );
  static TextStyle h5Semibold = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );
  static TextStyle h6Semibold = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );
  static TextStyle h7Semibold = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );

  // Heading text style Medium
  static TextStyle h1Medium = GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle h2Medium = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle h3Medium = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle h4Medium = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle h5Medium = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle h6Medium = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle h7Medium = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );

  // Heading text style Regular
  static TextStyle h1Regular = GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
  static TextStyle h2Regular = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
  static TextStyle h3Regular = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
  static TextStyle h4Regular = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
  static TextStyle h5Regular = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
  static TextStyle h6Regular = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
  static TextStyle h7Regular = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );

  // Paragraph TextStyle
  static TextStyle bodySemibold = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: textColorWhite,
  );
  static TextStyle bodyMedium = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textColorWhite,
  );
  static TextStyle bodyRegular = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColorWhite,
  );
}
