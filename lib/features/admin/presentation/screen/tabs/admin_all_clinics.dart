import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/features/admin/presentation/manager/admin_controller.dart';
import 'package:clinics_app/features/admin/presentation/screen/add_new_clinic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_padding.dart';
import '../../../../../core/utils/injections.dart';
import '../../../../user/domain/entities/clinic_details_model.dart';
import '../../../../user/presentation/manager/user_controller.dart';
import '../../../../user/presentation/widgets/clinic_tab_widgets/clinic_tab_header.dart';
import '../../widgets/admin_clinic_tab_container.dart';

class AdminAllClinics extends StatelessWidget {
   AdminAllClinics({super.key});


  final controller = sl<UserController>();
  final adminController = sl<AdminController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ConstPadding.resPadding(context),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(

          onPressed: () {
            adminController.clearController();
            Get.to(AddNewClinic());
          },
          backgroundColor: ConstColor.blueConstColor,
          child:  Icon(Icons.add,color: Colors.white,size: 4.h,),
        ),
          body:Obx(()=>
          controller.isAllFunctionLoading.value ?

              const Center(child: CircularProgressIndicator())
              :
              SafeArea(
                        child: Container(
                // padding: ConstPadding.resPadding(context),
                height: 100.h,
                width: 100.w,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                     ClinicTabHeader(text: 'Clinic near by',onPressed: ()=> Get.back(),),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      width: 90.w,
                      child: Text(
                        'Services',
                        style: GoogleFonts.dmSans(
                            fontSize: 2.2.h, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    // ClinicTabServiceContainer(),
                    SizedBox(
                      height: 1.h,
                    ),


                    SizedBox(
                      height: 75.h,
                      width: 90.w,
                      child: ClinicPPP(controller) == 0 ?

                      Center(

                          child: Text('No data',style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 3.5.h
                          ),))
                          :

                      ListView.builder(
                          itemCount: ClinicPPP(controller),
                          itemBuilder: (context,index){
                            ClinicDetailsModel mdl = Model(controller, index);
                            return AdminClinicTabContainer(model: mdl,);
                          }),
                    )


                  ],
                )),
                      ),)
      ),
    );
  }
}




int ClinicPPP(UserController controller){

  if(controller.categoryIndex.value  == 0){
    return controller.getClinicData.length;
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

  if(controller.categoryIndex.value == 0){
    return controller.getClinicData[index];
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