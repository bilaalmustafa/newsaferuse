import 'package:clinics_app/features/user/lacewatch/core/config/size.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class FontConstants {
  static const String fontFamily = 'Roboto';
}

class TextWeight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight black = FontWeight.w900;
}

TextStyle _getTextStyle(double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return GoogleFonts.figtree(fontSize: fontSize, color: color, fontWeight: fontWeight);
}

TextStyle getRegularStyle({double fontSize = Sizes.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, TextWeight.regular, color);
}

TextStyle getLightStyle({double fontSize = Sizes.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, TextWeight.light, color);
}

TextStyle getBoldStyle({double fontSize = Sizes.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, TextWeight.bold, color);
}

TextStyle getSemiBoldStyle({double fontSize = Sizes.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, TextWeight.semiBold, color);
}

TextStyle getMediumStyle({double fontSize = Sizes.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, TextWeight.medium, color);
}
