import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/core/constants/const_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';



class ProfileButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Function() onPressed;

  const ProfileButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.all(1.h),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 90.w,
          height: 05.h,
          decoration: BoxDecoration(
            color: ConstColor.blueConstColor,
            borderRadius: BorderRadius.circular(20.w),
          ),
          child: Padding(
            padding: EdgeInsets.only(left:4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                icon!,
                SizedBox(width: 6.w,),
                Text(text, style: ConstTextStyles.profileButton),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
