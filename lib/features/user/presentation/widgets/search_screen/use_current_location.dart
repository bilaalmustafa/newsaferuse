
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants/const_colors.dart';

class UseCurrentLocation extends StatelessWidget {
  const UseCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3.h,
      width: 90.w,
      child: Row(
        children: [
          SizedBox(width: 2.w,),
          Icon(Icons.location_on_outlined,color: ConstColor.blueConstColor,),

          SizedBox(width: 1.w,),

          Text('Use Current location',style: GoogleFonts.dmSans(
            fontSize: 16.sp,
            color: ConstColor.blueConstColor,
          ),),

        ],
      ),
    );
  }
}
