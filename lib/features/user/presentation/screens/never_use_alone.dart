import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/core/constants/const_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_strings.dart';
import '../widgets/clinic_tab_widgets/clinic_tab_header.dart';
import '../widgets/title_text_container.dart';
import 'package:flutter_svg/flutter_svg.dart';


class NeverUseAlone extends StatelessWidget {
  const  NeverUseAlone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),
                 ClinicTabHeader(text: 'Never use alone',onPressed: ()=> Get.back(),),
                SizedBox(
                  height: 3.h,
                ),

                TitleTextContainer(title: 'What is the Never Use Alone service?', text: ConstString.useAloneService),

                SizedBox(
                  height: 2.h,
                ),

               TitleTextContainer(title: 'Calls to Never Use Alone are confidential', text: ConstString.confidential),


                SizedBox(
                  height: 32.h,
                ),

                InkWell(
                  onTap: () async {
                    const number = '12345678900'; //set the number here
                    bool? res = await FlutterPhoneDirectCaller.callNumber(number);

                  },
                  child: Container(
                    height: 05.5.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color:ConstColor.blueConstColor,
                      borderRadius: BorderRadius.circular(07.w)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 30.w),
                      child: Row(
                        children: [
                          SvgPicture.asset(ConstIcon.phoneForButtonSvg),
                          SizedBox(width: 3.w,),
                          Text(
                            'Get Help',
                            style: GoogleFonts.dmSans(fontSize: 16.sp,color:Colors.white,fontWeight:FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                  ),
                )
                

              ],
            ),
          ),
        ),
      ),
    );
  }
}
