import 'package:clinics_app/core/constants/const_icons.dart';
import 'package:clinics_app/core/constants/const_img.dart';
import 'package:clinics_app/core/controllers/home_controllers.dart';
import 'package:clinics_app/core/dummy_models/dummy_data.dart';
import 'package:clinics_app/core/dummy_models/dummy_model.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:clinics_app/features/user/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../core/utils/injections.dart';
import '../../../widgets/home_tab_widgets/home_ta_denotion_container.dart';
import '../../../widgets/home_tab_widgets/home_tab_custom_clip_rreact.dart';
import '../../../widgets/home_tab_widgets/home_tab_gridlview_container.dart';
import '../../../widgets/home_tab_widgets/home_tab_qoutes_container.dart';
import '../../../widgets/home_tab_widgets/home_tab_title_text.dart';
import '../../drugs_used_check_list.dart';
import '../../good_samaritan_law.dart';
import '../../never_use_alone.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location/location.dart';



class HomeTab extends StatelessWidget {
   HomeTab({super.key});

  final controller = sl<UserController>();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Obx(()=>
            controller.isAllFunctionLoading.value ?
                const Center(child: CircularProgressIndicator())
            :
            Container(
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
                      InkWell(
                        onTap: () async {
                          var location = Location();
                          if(!await location.serviceEnabled()){
                            location.requestService();
                            EasyLoading.dismiss();
                          }
                          else{
                            EasyLoading.show();
                            Position pos = await controller.determinePosition();
                            await controller.getNearMeClinics(lat: pos.latitude,  long:pos.longitude).whenComplete((){
                              print('kjshdfjkshajfkhsak ${pos.latitude}, ${pos.longitude}');
                              EasyLoading.dismiss();
                              Get.to( SearchScreen());
                            });
                          }


                               } ,
                        child: SizedBox(
                          width: 80.w,
                          child: Row(
                            children: [
                              SvgPicture.asset(ConstIcon.locationIconSvg),
                              SizedBox(width: 2.w,),

                              Text('Bervely heels , LA',style: GoogleFonts.dmSans(
                                  fontSize: 16.sp
                              ),),

                              SizedBox(width: 2.w,),

                              SvgPicture.asset(ConstIcon.dropDownSvg),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 2.w,),
                       // InkWell(
                       //     onTap: ()=> Get.to(SignInScreen()),
                       //     child: const Icon(Icons.login))

                    ],
                  ),
                ),

                SizedBox(height: 2.h,),

                HomeTabCustomClipReact(img: ConstImg.homeTabFromContainer, onPressed: () => sl<HomeController>().setUserHomeTabIndex(1),),

                SizedBox(height: 2.h,),

                const HomeTabTitleText(text: 'Explore activities'),



                SizedBox(height: 1.h,),

                SizedBox(
                  height: 38.h,
                  width: 90.w,
                  child: GridView.builder(
                      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: DummyData().dummyDataList.length,
                      itemBuilder: (context,index){
                        DummyModel mdl = DummyData().dummyDataList[index];
                        return  HomeTabGridViewContainer(image: mdl.image, title: mdl.title, text: mdl.text, onPressed: () {
                          navigation(index, context);
                        },);
                      }),
                ),


                SizedBox(height: 1.h,),

                const HomeTabTitleText(text: 'Quotes of the day'),


                SizedBox(height: 1.h,),

               Obx(()=> controller.isQuoteLoaded.value ?  HomeTabQuoteContainer(quotesModel: controller.singleQuote!,) : const SizedBox.shrink() ),


                SizedBox(height: 2.h,),

                HomeTabCustomClipReact(img: ConstImg.homeTabSponsor, onPressed: () {},),


                SizedBox(height: 2.h,),


                const HomeTabTitleText(text: 'Donation'),



                SizedBox(height: 1.h,),



                 Obx(()=>
                     controller.isQuoteLoaded.value?
                     HomeTabDonationContainer(onPressed: ()=> sl<HomeController>().setUserHomeTabIndex(2), model: controller.singleDonation!,)
                 :
                         const SizedBox.shrink()
                 ),

                SizedBox(height: 2.h,),



              ],
            ),
          ),
        ),)
      ),
    );
  }
}



void navigation(int index,BuildContext context) {
  if (index == 0) {
    Get.to(const DrugsUseCheckList());
  }
  else if (index == 1) {
    Get.to( GoodSamaritanLaw());
  }
  else {
    Get.to(const NeverUseAlone());
  }
}
