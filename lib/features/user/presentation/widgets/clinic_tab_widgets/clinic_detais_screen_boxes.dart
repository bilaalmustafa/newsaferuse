import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ClinicDetailsScreenBoxes extends StatelessWidget {
  const ClinicDetailsScreenBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Wrap(
        runSpacing: 2.w,
        children: [
          OneByOneBox(text: 'Syringes',),

          SizedBox(width: 4.w,),
          OneByOneBox(text: 'Safer smoking kits',),

          SizedBox(width: 4.w,),
          OneByOneBox(text: 'Medical Care'),

          SizedBox(width: 3.w,),

          OneByOneBox(text: ' CBR ',),
          SizedBox(width: 3.w,),
          OneByOneBox(text: ' Blood Test',),
          SizedBox(width: 3.w,),
          OneByOneBox( text: ' Smoke Test'),
          SizedBox(width: 2.w,),
        ],
      ),
    );
  }
}


class OneByOneBox extends StatelessWidget {
  final String text;
  const OneByOneBox({super.key, required this.text});


  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 5.h,
      margin: EdgeInsets.only(right: 0.2.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(05.w),
          color: Colors.grey.withOpacity(0.5),
          // border: Border.all(color: Colors.black)
      ),
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Text(
          text,
          style: GoogleFonts.dmSans(fontSize: 14.7.sp, color: Colors.black),
        ),
      ),
    );
  }
}
