import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleDefault{
  StyleDefault._();

  static ThemeData get lightTheme{
    return ThemeData(
      useMaterial3: true,
      textTheme: _buildDefaultTextTheme()
    );
  }

  static TextTheme _buildDefaultTextTheme(){
    return GoogleFonts.nunitoTextTheme().copyWith(
      bodyLarge: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          bodyMedium: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          bodySmall: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          labelMedium: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          labelSmall: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          titleMedium: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
          ),
          titleSmall: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
    );
  }
}