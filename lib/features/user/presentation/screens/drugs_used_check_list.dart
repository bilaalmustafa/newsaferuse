import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/clinic_tab_widgets/clinic_tab_header.dart';
import '../widgets/drugs_used_check_list_widgets/drugs_use_check_list_check_line.dart';

class DrugsUseCheckList extends StatelessWidget {
  const DrugsUseCheckList({super.key});

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
                 ClinicTabHeader(text: 'Drugs use checklist',onPressed: ()=> Get.back(),),
                SizedBox(
                  height: 6.h,
                ),
                
                
                const DrugsUseCheckListCheckLine(text: 'A tendency to isolate'),
                const DrugsUseCheckListCheckLine(text: 'Difficulty managing stress without drinking \nor using drugs'),
                const DrugsUseCheckListCheckLine(text: 'Lying or avoidance to continue drinking or \ndrug use'),
                const DrugsUseCheckListCheckLine(text: 'Impulsive drinking or using, regardless of the \nconsequences'),
                const DrugsUseCheckListCheckLine(text: 'Anxiousness about working overtime or extra \nshifts'),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
