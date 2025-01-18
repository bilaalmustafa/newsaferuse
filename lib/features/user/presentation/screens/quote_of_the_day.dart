import 'package:clinics_app/core/constants/const_img.dart';
import 'package:clinics_app/features/user/domain/entities/quotes_model.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/injections.dart';
import '../widgets/clinic_tab_widgets/clinic_tab_header.dart';

class QuoteOfTheDay extends StatelessWidget {

  final QuotesModel quotesModel;
   QuoteOfTheDay({super.key, required this.quotesModel});

  final controller = sl<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
           Container(
            height: 100.h,
            width: 100.w,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                   ClinicTabHeader(text: 'Quote of the day',onPressed: ()=> Get.back(),),
                  SizedBox(
                    height: 2.h,
                  ),

                  Container(
                    height: 40.h,
                    width: 95.w,
                    child: Stack(
                      children: [
                       SizedBox(
                         height: 40.h,
                         width: 95.w,
                          child:
                          quotesModel.imgUrl!.isEmpty ?
                          Center(child: Text('No Image '),)
                              :
                          Image.network(quotesModel.imgUrl!,fit: BoxFit.cover,)
                       ),
                        Positioned(
                          bottom: 3.h,
                          left: 2.h,
                          child: SizedBox(
                            width: 85.w,
                            child: Column(
                              children: [
                                Text(quotesModel.quote!,style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                    fontWeight: FontWeight.w500
                                ),),

                                SizedBox(height: 2.h,),

                                Text('- ${quotesModel.author}',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400
                                ),)
                              ],
                            )
                          ),
                        )

                      ],
                    ),
                    ),

                  SizedBox(
                    height: 2.h,
                  ),

                  SizedBox(
                    height: 35.h,
                    width: 95.w,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 80.w,
                          child: Text(
                            'About Author',
                            style: GoogleFonts.dmSans(fontSize: 18.sp,fontWeight:FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 80.w,
                          child: Text(
                            quotesModel.authorDetails!,
                            style: GoogleFonts.dmSans(fontSize: 15.sp),
                          ),
                        ),
                      ],
                    )
                  )





                ],
              ),
            ),
          ),
        ),

    );
  }
}
