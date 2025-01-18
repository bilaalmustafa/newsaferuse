import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/controllers/home_controllers.dart';
import '../../../../core/utils/injections.dart';
import 'package:flutter_svg/flutter_svg.dart';


class UserHomeScreenMenuButton extends StatelessWidget {
  final int userHomeIndex;
  final String iconImageLink,text;
  final Color? color;
  UserHomeScreenMenuButton({super.key, required this.userHomeIndex, required this.iconImageLink, required this.text, this.color});
  final controller = sl<HomeController>();

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()=> controller.setUserHomeTabIndex(userHomeIndex),
      child: Column(
        children: [
          SvgPicture.asset(
            height: 3.2.h,
            width: 7.w,
            iconImageLink,
            // ConstIcon.home,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 0.5.h,),

          Text( text,style: GoogleFonts.poppins(fontSize: 14.sp,
            color: color

          ),)
        ],
      ),
    );
  }
}

