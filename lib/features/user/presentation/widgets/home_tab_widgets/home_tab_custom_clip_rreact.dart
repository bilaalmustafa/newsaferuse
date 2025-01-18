import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class HomeTabCustomClipReact extends StatelessWidget {
  final String img;
  final Function() onPressed;
  const HomeTabCustomClipReact({super.key, required this.img, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(02.w),
        child: Container(
          height: 20.h,
          width: 90.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(02.w),
          ),
          child: Image.asset(
              fit: BoxFit.cover,
              img),
        ),
      ),
    );
  }
}
