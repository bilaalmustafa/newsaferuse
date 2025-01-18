import 'package:clinics_app/core/controllers/home_controllers.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../core/utils/injections.dart';
import '../../../../domain/entities/clinic_details_model.dart';
import '../../../widgets/clinic_tab_widgets/clinic_tab_header.dart';
import '../../../widgets/clinic_tab_widgets/clinic_tab_main_container.dart';
import '../../../widgets/clinic_tab_widgets/clinic_tab_service_container.dart';



class ClinicTab extends StatelessWidget {
   ClinicTab({super.key});


   final controller = sl<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(()=>  SafeArea(
        child: Container(
            height: 100.h,
            width: 100.w,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),
                 ClinicTabHeader(text: 'Clinic near by',onPressed: ()=> sl<HomeController>().setUserHomeTabIndex(0)),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: 90.w,
                  child: Text(
                    'Services',
                    style: GoogleFonts.dmSans(
                        fontSize: 17.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                ClinicTabServiceContainer(),
                SizedBox(
                  height: 3.h,
                ),


                SizedBox(
                  height: 64.h,
                  width: 90.w,
                  child: ClinicPPP(controller) == 0 ?

                      Center(

                          child: Text('No data',style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp
                          ),))
                  :

                  ListView.builder(
                      itemCount: ClinicPPP(controller),
                      itemBuilder: (context,index){
                        ClinicDetailsModel mdl = Model(controller, index);
                        return ClinicTabMainContainer(model: mdl,);
                      }),
                )


              ],
            )),
      ),)
    );
  }

}


int ClinicPPP(UserController controller){

  if(controller.categoryIndex.contains(0)){
    return controller.getClinicData.length;
  }else{
    return controller.getSortedClinicData.length;
  }
  if(controller.categoryIndex.value  == 1){
    return controller.getAllClinicSyringesCategory.length;
  }
  if(controller.categoryIndex.value == 2){
    return controller.getAllClinicSaferSmokingKitsCategory.length;
  }
  if(controller.categoryIndex.value  == 3){
    return controller.getAllClinicMedicalCaresCategory.length;
  }
  if(controller.categoryIndex.value == 4){
    return controller.getAllClinicCBRCategory.length;
  }
  if(controller.categoryIndex.value  == 5){
    return controller.getAllClinicBloodTestCategory.length;
  }
  if(controller.categoryIndex.value  == 6){
    return controller.getAllClinicHIVTestCategory.length;
  }
  return 0;

}

ClinicDetailsModel Model(UserController controller, int index){

  if(controller.categoryIndex.contains(0)){
    return controller.getClinicData[index];
  }else{
    return controller.getSortedClinicData[index];

  }
  if(controller.categoryIndex.value == 1){
    return controller.getAllClinicSyringesCategory[index];
  }
  if(controller.categoryIndex.value  == 2){
    return controller.getAllClinicSaferSmokingKitsCategory[index];
  }
  if(controller.categoryIndex.value  == 3){
    return controller.getAllClinicMedicalCaresCategory[index];
  }
  if(controller.categoryIndex.value  == 4){
    return controller.getAllClinicCBRCategory[index];
  }
  if(controller.categoryIndex.value == 5){
    return controller.getAllClinicBloodTestCategory[index];
  }
  if(controller.categoryIndex.value  == 6){
    return controller.getAllClinicHIVTestCategory[index];
  }
  return controller.getClinicData[index];

}