import 'package:clinics_app/features/user/domain/entities/quotes_model.dart';
import 'package:clinics_app/features/user/presentation/screens/quote_of_the_day.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants/const_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';



class HomeTabQuoteContainer extends StatelessWidget {
  final QuotesModel quotesModel;

  const HomeTabQuoteContainer({super.key, required this.quotesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to( QuoteOfTheDay(quotesModel: quotesModel,)),
      child: Container(
          width: 90.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(02.w),
            color: const Color(0xff1F2636),
          ),
          child:  Padding(
            padding: EdgeInsets.only(left:6.w,right: 6.w),
            child: Column(
              children: [

                SizedBox(height: 3.h,),

                Text(quotesModel.quote!,style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.sp
                ),),
                SizedBox(height: 1.h,),

                Text(quotesModel.author!,style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.sp
                ),),

                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                      width: 8.w,
                      height: 4.h,
                      child: SvgPicture.asset(
                          fit: BoxFit.contain,
                          ConstIcon.rightForwardSvg)),
                ),


                SizedBox(height: 2.h,)


              ],
            ),
          )
      ),
    );
  }
}
