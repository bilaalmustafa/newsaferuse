import 'package:clinics_app/core/constants/const_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class ProfileListTile extends StatelessWidget {
  final String text;
  final String title;

  const ProfileListTile({
    super.key,
    required this.text,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 05.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 2.h, right: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 20.w,

                child: Text(title, style: ConstTextStyles.profileListTile)),
            SizedBox(
              width: 60.w,
              child:  Text(text, style: ConstTextStyles.profileListTile),),

          ],
        ),
      ),
    );
  }
}
