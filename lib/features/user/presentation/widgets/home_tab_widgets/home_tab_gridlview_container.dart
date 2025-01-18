import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeTabGridViewContainer extends StatelessWidget {
  final String image,title,text;
  final Function() onPressed;
  const HomeTabGridViewContainer({super.key, required this.image, required this.title, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 18.h,
        width: 43.w,
        child: Column(
          children: [
            Container(
              width: 43.w,
              height: 10.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.w),
                    topLeft: Radius.circular(5.w)),
                color: Colors.red,
                image:  DecorationImage(
                  image:
                  AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 1.h,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(title,style: GoogleFonts.dmSans(
                  fontSize: 15.5.sp,
                  fontWeight:FontWeight.bold
              ),),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(text,style: GoogleFonts.dmSans(
                fontSize: 13.sp,
              ),),
            ),


          ],
        ),
      ),
    );
  }
}
