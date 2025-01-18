import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DrugsUseCheckListCheckLine extends StatelessWidget {
  final String text;
  const DrugsUseCheckListCheckLine({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 90.w,
          child: Row(
            children: [

              SvgPicture.asset(ConstIcon.checkCircleSvg),

              SizedBox(width: 3.w,),

              Text(
               text,
                style: GoogleFonts.dmSans(fontSize: 15.5.sp),
              ),




            ],
          ),
        ),

        SizedBox(height: 1.5.h,)
      ],
    );
  }
}
