import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConstTextStyles {



  static var titleTextStyle = GoogleFonts.dmSans(
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: 2.2.h,
      decoration: TextDecoration.none);


  static var loginText = GoogleFonts.dmSans(
      fontWeight: FontWeight.bold,
      fontSize: 22.sp,
      color: Colors.black,
      decoration: TextDecoration.none

  );

  static var textButtonStyle = GoogleFonts.dmSans(
      color: Colors.black,
      fontSize: 2.h,
      decoration: TextDecoration.underline,
      decorationColor: Colors.black
  );



  static var forgotPassword = GoogleFonts.dmSans(
      fontWeight: FontWeight.bold,
      // color: Colors.bl,
      fontSize: 22.sp,
      decoration: TextDecoration.none
  );

  static var forgotPasswordText = GoogleFonts.dmSans(
    // fontWeight: FontWeight.bold,
    //   color: Colors.white,
      fontSize: 16.sp,
      decoration: TextDecoration.none
  );


  static var profileListTile =  GoogleFonts.poppins(
      fontSize: 1.7.h,
      fontWeight: FontWeight.w500,
      color: Colors.black
  );



  static var profileButton =  GoogleFonts.poppins(
      fontSize: 1.7.h,
      fontWeight: FontWeight.w600,
      color: Colors.white
  );


}