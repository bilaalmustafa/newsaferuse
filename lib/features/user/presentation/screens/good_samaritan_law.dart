import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_strings.dart';
import '../../../../core/controllers/home_controllers.dart';
import '../../../../core/utils/injections.dart';
import '../../../admin/presentation/widgets/custom_drop_down.dart';
import '../widgets/clinic_tab_widgets/clinic_tab_header.dart';
import '../widgets/state_drop_down.dart';
import '../widgets/title_text_container.dart';

class GoodSamaritanLaw extends StatelessWidget {
  GoodSamaritanLaw({super.key});

  final controller = sl<HomeController>();

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
              ClinicTabHeader(
                text: 'Good Samaritan Law',
                onPressed: () => Get.back(),
              ),
              SizedBox(
                height: 3.h,
              ),
              StateDropDownMenu(),
              SizedBox(
                height: 3.h,
              ),
              Obx(() => Container(
                    child: Padding(
                      padding:  EdgeInsets.only(left: 2.4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.selectedStateModel.value.title!,style:   GoogleFonts.dmSans(fontSize: 18.sp, fontWeight: FontWeight.bold),),

                          SizedBox(height: 1.h,),

                          Text(controller.selectedStateModel.value.subTitle! , style:   GoogleFonts.dmSans(fontSize: 16.sp, fontWeight: FontWeight.w600),),

                          SizedBox(height: 1.h,),

                          TrueFalseText(text: controller.selectedStateModel.value.arrest! ? "[ X ] Arrest" : "[ - ] Arrest"),
                          TrueFalseText(text: controller.selectedStateModel.value.charge! ? "[ X ] Arrest" : "[ - ] Arrest"),
                          TrueFalseText(text: controller.selectedStateModel.value.prosecution! ? "[ X ] Arrest" : "[ - ] Arrest"),



                          SizedBox(height: 2.h,),



                          Text(controller.selectedStateModel.value.subTitleTwo!, style:   GoogleFonts.dmSans(fontSize: 16.sp, fontWeight: FontWeight.w600),),


                          SizedBox(height: 1.h,),
                          TrueFalseText(text: controller.selectedStateModel.value.arrestTwo! ? "[ X ] Arrest" : "[ - ] Arrest"),
                          TrueFalseText(text: controller.selectedStateModel.value.chargeTwo! ? "[ X ] Arrest" : "[ - ] Arrest"),
                          TrueFalseText(text: controller.selectedStateModel.value.prosecutionTwo! ? "[ X ] Arrest" : "[ - ] Arrest"),



                          SizedBox(height: 2.h,),


                          Text(controller.selectedStateModel.value.lastDesc!, style:   GoogleFonts.dmSans(fontSize: 16.sp, fontWeight: FontWeight.w600),),


                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}


class TrueFalseText extends StatelessWidget {
  final String text;
  const TrueFalseText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: .5.h),
      child: Text(text,
        style:   GoogleFonts.dmSans(fontSize: 16.sp, fontWeight: FontWeight.w500),),
    );
  }
}
