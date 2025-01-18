import 'package:clinics_app/core/constants/const_img.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../core/controllers/home_controllers.dart';
import '../../../../../../core/utils/injections.dart';
import '../../../widgets/clinic_tab_widgets/clinic_tab_header.dart';
import '../../../widgets/clinic_tab_widgets/clinic_tab_two_main_container.dart';

class ClinicTabTwo extends StatelessWidget {
  const ClinicTabTwo({super.key});

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
                ClinicTabHeader(text: 'Clinic near by',onPressed: ()=> sl<HomeController>().setUserHomeTabIndex(0)),
                SizedBox(
                  height: 1.h,
                ),
                ClinicTabTwoMainContainer(
                  image: ConstImg.clinicTabImageOne,
                  title: 'Christian Health Centers LA',
                  location: '303 E 5th St, Los Angeles, CA 90013, United States',
                  openOrClose: 'Close',
                  timing: ' - Opens 7:30 am Mon',
                  mobile: '+1 213-893-1960',
                ),
            
                ClinicTabTwoMainContainer(
                  image: ConstImg.clinicTabImageTwo,
                  title: 'Christian Health Centers LA',
                  location: '303 E 5th St, Los Angeles, CA 90013, United States',
                  openOrClose: 'Close',
                  timing: ' - Opens 7:30 am Mon',
                  mobile: '+1 213-893-1960',
                ),
                ClinicTabTwoMainContainer(
                  image: ConstImg.clinicTabImageThree,
                  title: 'Christian Health Centers LA',
                  location: '303 E 5th St, Los Angeles, CA 90013, United States',
                  openOrClose: 'Close',
                  timing: ' - Opens 7:30 am Mon',
                  mobile: '+1 213-893-1960',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
