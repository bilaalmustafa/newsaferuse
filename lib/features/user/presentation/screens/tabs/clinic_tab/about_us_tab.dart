import 'package:clinics_app/core/constants/const_img.dart';
import 'package:clinics_app/core/constants/const_strings.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../widgets/about_us_tab_widgets/about_us_tab_first_container.dart';
import '../../../widgets/about_us_tab_widgets/about_us_tab_second_container.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsTab extends StatelessWidget {
  const AboutUsTab({super.key});

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
              SizedBox(height: 5.h,),

              Padding(
                padding:  EdgeInsets.only(right: 50.w),
                child: Image.asset(
                  width: 40.w,
                  height: 8.h,
                  ConstImg.splashScreenLogo,fit: BoxFit.cover,),
              ),


              SizedBox(height: 1.5.h,),

              AboutUsTabFirstContainer(title: 'Promoting Health Equity',
                through: 'Through',
                differentColorText: 'Harm Reduction',
                text: ConstString.aboutUs,),

              SizedBox(height: 4.h,),

              AboutUsTabSecondContainer(title: 'Our Mission', text: ConstString.ourMission),

            ],
          ),
        ),
      ),
    );
  }
}
