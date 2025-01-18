import 'package:clinics_app/core/controllers/home_controllers.dart';
import 'package:clinics_app/features/user/domain/entities/donation_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_img.dart';
import '../../../../../core/utils/injections.dart';

class HomeTabDonationContainer extends StatelessWidget {
  final Function() onPressed;
  final DonationModel model;


  const HomeTabDonationContainer({super.key, required this.onPressed, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 90.w,
        // height: 22.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.w),
              topLeft: Radius.circular(5.w)),),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.w),
                  topLeft: Radius.circular(5.w)),
              child: Container(
                width: 90.w,
                height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.w),
                      topLeft: Radius.circular(5.w)),
                ),
                child:
                model.donationImg!.isEmpty ?
                Image.asset(ConstImg.homeTabLast,fit: BoxFit.cover,)
                      :
                Image.network(model.donationImg!,fit: BoxFit.cover,)
              ),
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Text(model.title!,style: GoogleFonts.dmSans(
                  fontSize: 2.1.h,
                  fontWeight:FontWeight.bold
              ),),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(model.description!,style: GoogleFonts.dmSans(
                fontSize: 1.7.h,
              ),),
            ),



          ],
        ),
      ),
    );
  }
}
