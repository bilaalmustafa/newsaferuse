import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/utils/injections.dart';

class ClinicTabSelectContainer extends StatelessWidget {
  final Color? color;
  final String text;
  final int categoryIndex;

   ClinicTabSelectContainer({
    super.key,
    this.color,
    required this.text, required this.categoryIndex,
  });

  final controller = sl<UserController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> controller.setCategoryIndex(categoryIndex),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(05.w),
            color: color,
            border: Border.all(color: Colors.black)),
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: Text(
            text,
            style: GoogleFonts.dmSans(fontSize: 14.sp, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
