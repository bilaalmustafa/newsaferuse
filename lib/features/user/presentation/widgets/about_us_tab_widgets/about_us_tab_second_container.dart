import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AboutUsTabSecondContainer extends StatelessWidget {
  final String title,text;
  const AboutUsTabSecondContainer({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 95.w,
        // height: 25.h,
        child: Column(
          children: [
            SizedBox(
              width: 90.w,
              child: Text(
                title,
                style: GoogleFonts.dmSans(
                  fontSize: 17.5.sp, fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(
              height: 0.5.h,
            ),
            SizedBox(
              width: 90.w,
              child: Text(
               text,
                style: GoogleFonts.dmSans(fontSize: 15.sp),
              ),
            ),
          ],
        )
    );
  }
}
