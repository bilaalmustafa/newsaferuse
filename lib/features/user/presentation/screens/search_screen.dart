import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:clinics_app/features/user/presentation/widgets/search_screen/use_current_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/injections.dart';
import '../../domain/entities/clinic_distance_model.dart';
import '../widgets/clinic_tab_widgets/clinic_distance.dart';

class SearchScreen extends StatelessWidget {
  final controller = sl<UserController>();
   SearchScreen({super.key});

   TextEditingController textEditingController = TextEditingController();

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
                SizedBox(height: 2.h,),
                SizedBox(
                  height: 3.h,
                  width: 90.w,
                  child: Row(
                    children: [
                      SizedBox(width: 2.w,),
                      InkWell(
                          onTap: ()=>Get.back(),
                          child: const Icon(Icons.close)),
            
                      SizedBox(width: 2.w,),
            
                      Text('Locations',style: GoogleFonts.dmSans(
                          fontSize: 16.sp,
                        fontWeight: FontWeight.w700
                      ),),
            
                    ],
                  ),
                ),
            
                SizedBox(height: 2.h,),
            
                SizedBox(
                  width: 90.w,
                  child: TextFormField(
                    decoration: InputDecoration(
                      errorStyle:  TextStyle(color: Colors.red,fontSize: 17.sp),
                      labelStyle: TextStyle(color: Colors.grey,fontSize: 17.sp),
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 18.sp),
                      prefixIcon:  Icon(Icons.search,size: 22.sp,),
                      contentPadding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 5.w),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.w),
                        borderSide:  const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: InputBorder.none,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        ),
                        //   borderRadius: BorderRadius.circular(3.w),
                        // ),
                      ),
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black
                          )
                      ),
                    ),
                    controller: textEditingController,
                    onChanged: (value) async {
                      List<Location> locations = await locationFromAddress(textEditingController.text.trim());
                      controller.getNearMeClinics(lat: locations.last.latitude,  long:locations.last.longitude);
                    },

                  ),
                ),

                SizedBox(height: 2.h,),

                
                
            
                GestureDetector(
                    onTap: ()async {
                      EasyLoading.show();
                      textEditingController.clear();
                      Position pos = await controller.determinePosition();
                      await controller.getNearMeClinics(lat: pos.latitude,  long:pos.longitude);
                      EasyLoading.dismiss();
                      print('kjshdfjkshajfkhsak ${pos.latitude}, ${pos.longitude}');
                      EasyLoading.dismiss();
                    },
                    child: const UseCurrentLocation()),
            
            
                SizedBox(height: 4.h,),
            
                // Expanded(
                //   child: controller.model.isNotEmpty
                //       ? ListView.builder(
                //       itemCount:  controller.model.length,
                //       itemBuilder: (context, index) {
                //         ClinicDetailsModel mdl = controller.model[index];
                //         return ClinicTabMainContainer(model: mdl);
                //       }
                //   )
                //       : const Text(
                //     'No results found',
                //     style: TextStyle(fontSize: 24),
                //   ),
                // ),
            
                // SizedBox(
                //   height: 3.h,
                //   width: 90.w,
                //   child: Text('Recent',style: GoogleFonts.dmSans(
                //     fontSize: 16.sp,
                //     color: ConstColor.blueConstColor,
                //     fontWeight: FontWeight.w600
                //   ),),
                // ),
                //
                //
                //  SizedBox(
                //      width: 90.w,
                //      child: Divider(height: 2.h)),
                //
                //
                // const RecentSearchTab(address: 'Airport Courthouse',),
                // const RecentSearchTab(address: 'Cienega Blvd.',),
                // const RecentSearchTab(address: 'Disney Concert Hall',),
                // const RecentSearchTab(address: 'Hollywood Bowl Overlook',),
            
            
            
            
            
                SizedBox(
                  height: 72.h,
                  width: 90.w,
            
            
            child:
            
                Obx(()=>
                  ListView.builder(
                      itemCount: controller.nearMeList.length,
                      itemBuilder: (context,index){
                        ClinicDistanceModel mdl =controller.nearMeList[index] ;
                        return ClinicDistance(model: mdl,);
                      }),
                ),)
            
            
            
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
