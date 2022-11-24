import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SoftalesTheme {

  static TextTheme textTheme = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  );

  static ThemeData themeData = ThemeData(
    textTheme: textTheme,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  );
}