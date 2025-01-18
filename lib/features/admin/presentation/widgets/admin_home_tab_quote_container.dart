import 'package:clinics_app/features/admin/presentation/screen/tabs/admin_all_quotes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_icons.dart';
import '../../../user/domain/entities/quotes_model.dart';
import '../../../user/presentation/screens/quote_of_the_day.dart';

class AdminHomeTabQuoteContainer extends StatelessWidget {
  final QuotesModel quotesModel;

  const AdminHomeTabQuoteContainer({super.key, required this.quotesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(  AdminAllQuotes()),
      child: Container(
          height: 20.h,
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
                    fontSize: 2.2.h
                ),),
                SizedBox(height: 1.h,),

                Text(quotesModel.author!,style: TextStyle(
                    color: Colors.white70,
                    fontSize: 2.2.h
                ),),

                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                      width: 8.w,
                      height: 4.h,
                      child: Image.asset(
                          fit: BoxFit.contain,
                          ConstIcon.rightForward)),
                )


              ],
            ),
          )
      ),
    );
  }
}
