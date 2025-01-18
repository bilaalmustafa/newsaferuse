import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class TitleTextContainer extends StatelessWidget {
 final String title,text;

  const TitleTextContainer({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width: 95.w,
        child: Column(
          children: [
            SizedBox(
              width: 80.w,
              child: Text(
                title,
                style: GoogleFonts.dmSans(fontSize: 18.sp,fontWeight:FontWeight.bold,
                    color: ConstColor.blueConstColor),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: 80.w,
              child: Text(
                text,
                style: GoogleFonts.dmSans(fontSize: 14.sp),
              ),
            ),
          ],
        )
    );
  }
}
