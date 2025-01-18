import 'package:clinics_app/core/controllers/home_controllers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/utils/injections.dart';

class DetailsScreenAmountSelectContainer extends StatelessWidget {
  final String amount;
  final Color color;
  final Color borderColor;
  final int setSelectDonationAmountIndex;
  final int setSelectDonationAmountToController;

   DetailsScreenAmountSelectContainer({
    super.key,
    required this.amount,
     required this.color,
     required this.borderColor,
     required this.setSelectDonationAmountIndex,
     required this.setSelectDonationAmountToController,
  });

  final controller =sl<HomeController>();


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.setSelectDonationAmount(setSelectDonationAmountIndex);
        controller.setDonationAmountToController(setSelectDonationAmountToController);
      },
      child: Container(
        height: 4.h,
        width: 27.w,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(01.5.w),
            border: Border.all(
              color:borderColor,
            )),
        child: Center(
          child: Text(
            amount,
            style: GoogleFonts.dmSans(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
