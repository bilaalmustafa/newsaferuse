import 'package:clinics_app/core/constants/const_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_colors.dart';
import '../../../../core/constants/const_icons.dart';
import '../widgets/clinic_tab_widgets/clinic_tab_header.dart';
import '../widgets/custom_blue_button.dart';
import 'package:flutter_svg/flutter_svg.dart';



class SummaryScreen extends StatelessWidget {

  final String total;
  const SummaryScreen({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
               ClinicTabHeader(text: 'Summary',onPressed: ()=> Get.back(),),
              SizedBox(
                height: 3.h,
              ),

              Container(
                width: 90.w,
                height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(05.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 35.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.w),
                            topLeft: Radius.circular(5.w)),
                        // image: DecorationImage(
                        //   image: AssetImage(ConstImg.homeTabLast),
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                      child: Image.asset(ConstImg.homeTabLast,fit: BoxFit.contain,),
                    ),
                    SizedBox(
                      width: 55.w,
                      child: Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Column(
                          children: [

                            SizedBox(height: 3.h,),
                            Text(
                              'Help us in saving your loved one’s ',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            SizedBox(height: 2.h,),
                            Text(
                              'Donate once',
                              style: TextStyle(fontSize: 14.sp),
                            ),

                            SizedBox(
                              height: 0.5.h,
                            ),


                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5.h,),
              SizedBox(
                width: 90.w,
                child: Text(
                  'Payment method',
                  style: GoogleFonts.dmSans(fontSize: 16.sp,fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(
                  width: 90.w,
                  child: Column(
                    children: [
                      const Divider(),

                      SizedBox(height: 0.5.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 60.w,
                            child: Text(
                              'Payment method',
                              style: GoogleFonts.dmSans(fontSize: 16.sp,fontWeight: FontWeight.bold,
                              color:Colors.grey.withOpacity(0.5)),
                            ),
                          ),
                          Container(
                            width: 1.w,
                            height: 1.h,
                            color: Colors.green,
                          ),

                          InkWell(
                            onTap: () async {
                                const number = '12345678900'; //set the number here
                                bool? res = await FlutterPhoneDirectCaller.callNumber(number);
                            },
                            child: Container(
                              height: 03.h,
                              width: 22.w,
                              decoration: BoxDecoration(
                                  color:ConstColor.blueConstColor,
                                  borderRadius: BorderRadius.circular(01.w)
                              ),
                              child: Padding(
                                padding:  EdgeInsets.only(left: 2.w),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(ConstIcon.plusSvg),
                                    SizedBox(width: 2.w,),
                                    Text(
                                      'Get Help',
                                      style: GoogleFonts.dmSans(fontSize: 12.sp,color:Colors.white,fontWeight:FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),

                            ),
                          )





                        ],
                      ),

                      SizedBox(height: 0.5.h,),

                      const Divider(),
                    ],
                  )),


              SizedBox(height: 42.h,),

              SizedBox(
                width: 90.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: GoogleFonts.dmSans(fontSize: 16.sp,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$$total',
                      style: GoogleFonts.dmSans(fontSize: 16.sp,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 2.h,),
              
              CustomBlueButton(text: 'Confirm', onPressed: (){}),





            ],
          ),
        ),
      ),
    );
  }
}
