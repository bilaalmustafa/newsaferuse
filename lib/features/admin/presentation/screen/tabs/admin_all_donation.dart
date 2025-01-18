import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/features/admin/presentation/screen/add_new_donation.dart';
import 'package:clinics_app/features/admin/presentation/widgets/admin_all_donation_container.dart';
import 'package:clinics_app/features/user/domain/entities/donation_model.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_padding.dart';
import '../../../../../core/utils/injections.dart';
import '../../../../user/presentation/widgets/clinic_tab_widgets/clinic_tab_header.dart';

class AdminAllDonation extends StatelessWidget {
   AdminAllDonation({super.key});

  final userController = sl<UserController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        userController.isAllFunctionLoading.value ?

            const CircularProgressIndicator()
        :

        Container(
          padding: ConstPadding.resPadding(context),
          child: SafeArea(
                child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: ConstColor.blueConstColor,
            onPressed: ()=>Get.to(AddNewDonation()),
            child: Icon(Icons.add,color: Colors.white,size: 4.h,),
          ),
          body: Container(
            height: 100.h,
            width: 100.w,
            color: Colors.white,
            child:  Column(
              children: [
                SizedBox(height: 2.h,),
                ClinicTabHeader(text: 'All Donations',onPressed: ()=> Get.back(),),

                SizedBox(height: 2.h,),

                SizedBox(
                  height: 86.h,
                  width: 100.w,
                  child: ListView.builder(
                      itemCount: userController.getDonation.length,
                      itemBuilder: (context,index){
                        DonationModel mdl = userController.getDonation[index];
                        return
                          userController.getDonation.isEmpty ?
                          Center(child: Text('No Data',style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 3.h,
                              color: Colors.black
                          ),))
                              :
                          AdminAllDonationContainer(model: mdl);
                      }),

                )


              ],
            ),
          ),
                ),
              ),
        ));
  }
}
