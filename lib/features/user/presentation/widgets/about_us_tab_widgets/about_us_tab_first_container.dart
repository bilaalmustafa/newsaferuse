import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class AboutUsTabFirstContainer extends StatelessWidget {
  final String title, through, differentColorText, text;

  const AboutUsTabFirstContainer({
    super.key,
    required this.title,
    required this.through,
    required this.differentColorText,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 95.w,
        child: Column(
          children: [
            SizedBox(
              width: 90.w,
              child: Text(
                title,
                style: GoogleFonts.dmSans(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 90.w,
              child: Row(
                children: [
                  Text(
                    through,
                    style: GoogleFonts.dmSans(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    differentColorText,
                    style: GoogleFonts.dmSans(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                        color: ConstColor.blueConstColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: 90.w,
              child: Text(
                text,
                style: GoogleFonts.dmSans(fontSize: 15.sp),
              ),
            ),
          ],
        ));
  }
}
