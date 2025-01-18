
import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/core/constants/const_icons.dart';
import 'package:clinics_app/core/controllers/home_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/utils/injections.dart';
import '../../screens/summary_screen.dart';
import '../custom_blue_button.dart';
import '../custom_text_field.dart';
import 'details_screen_amount_select_container.dart';

class DetailsScreenModelBottomSheet extends StatelessWidget {
   DetailsScreenModelBottomSheet({super.key});

  final controller = sl<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Container(
      width: 100.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(03.w),
          topRight: Radius.circular(03.w),
        ),
        color: Colors.white,
      ),

      child: Form(
        key: controller.donationFormKey,
        child: Column(
          children: [
            SizedBox(height: 2.h,),
            SizedBox(
              width: 90.w,
              child: Text(
                ' Select donation amount',
                style: GoogleFonts.dmSans(
                  fontSize: 16.sp, fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 2.h,),


            SizedBox(
              width: 90.w,
              child: Wrap(
                spacing: 02.w,
                runSpacing: 01.5.h,

                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [

                  DetailsScreenAmountSelectContainer(amount: '\$5', setSelectDonationAmountIndex: 0, color: controller.selectDonationAmount.value==0 ? Colors.grey.withOpacity(0.7): Colors.white,borderColor: controller.selectDonationAmount.value==0 ? ConstColor.blueConstColor: Colors.grey, setSelectDonationAmountToController: 5,),
                  DetailsScreenAmountSelectContainer(amount: '\$10', setSelectDonationAmountIndex: 1, color: controller.selectDonationAmount.value==1 ? Colors.grey.withOpacity(0.7): Colors.white,borderColor: controller.selectDonationAmount.value==1 ? ConstColor.blueConstColor: Colors.grey, setSelectDonationAmountToController: 10,),
                  DetailsScreenAmountSelectContainer(amount: '\$20', setSelectDonationAmountIndex: 2, color: controller.selectDonationAmount.value==2 ? Colors.grey.withOpacity(0.7): Colors.white,borderColor: controller.selectDonationAmount.value==2 ? ConstColor.blueConstColor: Colors.grey, setSelectDonationAmountToController: 20,),
                  DetailsScreenAmountSelectContainer(amount: '\$50', setSelectDonationAmountIndex: 3, color: controller.selectDonationAmount.value==3 ? Colors.grey.withOpacity(0.7): Colors.white,borderColor: controller.selectDonationAmount.value==3 ? ConstColor.blueConstColor: Colors.grey, setSelectDonationAmountToController: 50,),
                  DetailsScreenAmountSelectContainer(amount: '\$100', setSelectDonationAmountIndex: 4, color: controller.selectDonationAmount.value==4 ? Colors.grey.withOpacity(0.7): Colors.white,borderColor: controller.selectDonationAmount.value==4 ? ConstColor.blueConstColor: Colors.grey, setSelectDonationAmountToController: 100,),
                  DetailsScreenAmountSelectContainer(amount: '\$200', setSelectDonationAmountIndex: 5, color: controller.selectDonationAmount.value==5 ? Colors.grey.withOpacity(0.7): Colors.white,borderColor: controller.selectDonationAmount.value==5 ? ConstColor.blueConstColor: Colors.grey, setSelectDonationAmountToController: 200,),


                ],
              ),
            ),


            SizedBox(height: 1.h,),
            SizedBox(
              width: 90.w,
              child: Text(
                'Other Amount',
                style: GoogleFonts.dmSans(
                  fontSize: 16.sp, fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 1.h,),

            CustomTextField(
              hintText: '',
              validator: controller.validate,
              controller: controller.selectAmountController,
              prefix: Image.asset(ConstIcon.dollarSign),
              textInputType: TextInputType.number,),

            SizedBox(height: 2.h,),

            CustomBlueButton(text: 'Continue', onPressed: (){

              if(controller.donationFormKey.currentState!.validate()){
                Get.to(SummaryScreen(total: controller.selectAmountController.text));
              }
            })






          ],
        ),
      ),
    ));
  }
}
