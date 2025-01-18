import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecentSearchTab extends StatelessWidget {
  final String address;
  const RecentSearchTab({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 3.h,
            width: 90.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(address,style: GoogleFonts.dmSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300
                ),),

                Icon(Icons.arrow_forward_ios_outlined,size: 18.sp,),

              ],
            ),
          ),

        SizedBox(height: 2.h,),
      ],
    );
  }
}
