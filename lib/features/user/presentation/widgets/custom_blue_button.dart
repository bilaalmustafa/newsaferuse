import 'package:clinics_app/core/constants/const_padding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_colors.dart';


class CustomBlueButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomBlueButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height/100;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 6.h,
        width: 90.w,
        decoration: BoxDecoration(
            color:ConstColor.blueConstColor,
            borderRadius: BorderRadius.circular(6.w)
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.dmSans(fontSize: 2.h,color:Colors.white,fontWeight:FontWeight.w500),
          ),
        ),

      ),
    );
  }
}
