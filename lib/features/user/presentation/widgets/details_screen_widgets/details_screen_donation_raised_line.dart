import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants/const_colors.dart';


class DetailsScreenDonationRaisedLine extends StatelessWidget {
  const DetailsScreenDonationRaisedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [


        SizedBox(
          width: 90.w,
          child: Text(
            'Donation Raised',
            style: GoogleFonts.dmSans(
              fontSize: 15.sp, fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 0.5.h,),


        SizedBox(
          height: 1.5.h,
          width: 90.w,
          child: Row(
            children: [
              Container(
                width: 45.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(05.w),bottomLeft: Radius.circular(05.w)),
                  color: ConstColor.blueConstColor,
                ),

              ),
              Container(
                width: 45.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(05.w),bottomRight: Radius.circular(05.w)),
                  color: Colors.grey,
                ),
              ),



            ],
          ),
        ),

        SizedBox(height: 0.5.h,),

        SizedBox(
          width: 90.w,
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              '\$ 2500/5000',
              style: GoogleFonts.dmSans(
                fontSize: 15.sp, fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
