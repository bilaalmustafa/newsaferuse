import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeTabTitleText extends StatelessWidget {
  final String text;
  const HomeTabTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Text(text,style: GoogleFonts.dmSans(
        fontSize: 2.4.h,
        fontWeight:FontWeight.w700,
      ),),
    );
  }
}
