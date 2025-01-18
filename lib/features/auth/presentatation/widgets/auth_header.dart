import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_colors.dart';

class AuthHeader extends StatelessWidget {
  final String text;
  const AuthHeader({super.key, required this.text});


  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 7.h,
      width: 100.w,
      color: ConstColor.blueConstColor,
      child: Center(
        child:Text(text,style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 2.5.h,
            fontWeight: FontWeight.w600

        ),),
      ),
    );
  }
}
