
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ClinicTabHeader extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const ClinicTabHeader({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.h,
      width: 95.w,
      child: Row(
        children: [

          SizedBox(width: 1.w,),

          InkWell(
            onTap: onPressed,
            child: SvgPicture.asset(
                fit: BoxFit.cover,
                ConstIcon.arrowLeftSvg),
          ),

          SizedBox(width: 1.5.w,),

          Text(
            text,
            style: GoogleFonts.dmSans(fontSize: 2.5.h,fontWeight:FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
