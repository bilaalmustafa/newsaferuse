import 'package:clinics_app/core/constants/const_icons.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/constants/const_colors.dart';
import '../../../../../core/constants/const_img.dart';
import '../../../../../core/constants/const_padding.dart';
import '../../../../../core/utils/injections.dart';
import '../../../domain/entities/clinic_details_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/clinic_tab_widgets/clinic_detais_screen_boxes.dart';


class ClinicDetailsScreen extends StatelessWidget {
  final ClinicDetailsModel model;
   ClinicDetailsScreen({super.key, required this.model});

  PageController controller = PageController();
  final userController = sl<UserController>();
  int value = 0;

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    DateTime officeTimeFrom=DateTime(time.year,time.month,time.day,model.fromHour!,model.fromMinute!);
    DateTime officeTimeTo=DateTime(time.year,time.month,time.day,model.toHour!,model.toMinute!);

    TimeOfDay officeFrom = TimeOfDay(hour: model.fromHour!, minute: model.fromMinute!);
    TimeOfDay officeTo = TimeOfDay(hour: model.toHour!, minute: model.toMinute!);


    List<Widget> generateImageList(List<dynamic> imageUrls) {
      return imageUrls.map((url) => Image.network(
          height: 30.h,
          width: 100.w,
          url, fit: BoxFit.cover)).toList();
    }


    return Obx(()=> userController.isAllFunctionLoading.value ?
        const Center(
          child: CircularProgressIndicator(),
        )
    :
        Scaffold(
            body:  SafeArea(
                child: Container(
                  padding: ConstPadding.resPadding(context),
                  width: 100.w,
                  height: 100.h,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                                    
                        SizedBox(height: 0.5.h,),
                        Stack(
                          children: [
                            SizedBox(
                              height: 30.h,
                              width: 100.w,
                              child: PageView(
                                  controller: controller,
                                  children: generateImageList(model.clinicImages!)
                              ),
                            ),
                            Positioned(
                              top: 2.w,
                              right: 2.5.w,
                              left: 2.5.w,
                              child: SizedBox(
                                height: 5.h,
                                // width: 80.w,
                                // width: ConstPadding.resEightyWidth(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    
                                    InkWell(
                                        onTap:()=> Get.back(),
                                        child: SvgPicture.asset(ConstIcon.clinicDetailsBackSvg)),
                                    
                                    InkWell(
                                      onTap: (){
                                        Share.share('https://www.google.com/maps/search/?api=1&query=${model.lat},${model.long}');
                                      },
                                      child: SvgPicture.asset(ConstIcon.clinicDetailsShareSvg),
                                    ),
                                    
                                    
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 2.h,
                              right: 25.w,
                              child: SizedBox(
                                height: 2.h,
                                width: 50.w,
                                child: Center(
                                  child: SmoothPageIndicator(
                                    controller: controller,
                                    onDotClicked: (value){
                                      controller.jumpToPage(value);
                                    },
                                    count:  model.clinicImages!.length,
                                    effect:   ExpandingDotsEffect(
                                      // spacing:  8.0,
                                      // radius:  4.0,
                                      dotWidth:  2.w,
                                      dotHeight:  1.h,
                                      paintStyle:  PaintingStyle.fill,
                                      strokeWidth:  1.5,
                                      dotColor:  Colors.white,
                                      activeDotColor:  Colors.white70,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                                    
                        SizedBox(height: 1.5.h,),
                                    
                                    
                        SizedBox(
                          // height: 18.h,
                          width: 90.w,
                          child: Column(
                            children: [
                                    
                              SizedBox(
                                  width: 90.w,
                                  child: Text(model.title!,style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp
                                  ),)),
                              SizedBox(
                                height: 0.5.h,
                              ),
                                    
                                    
                              Row(
                                children: [
                                  SvgPicture.asset(ConstIcon.locationIconSvg),
                                  SizedBox(
                                    width: 02.w,
                                  ),
                                  Text(
                                    model.address!,
                                    style: TextStyle(fontSize: 1.7.h),
                                  ),
                                ],
                              ),
                                    
                                    
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(ConstIcon.clockSvg),
                                  SizedBox(
                                    width: 02.w,
                                  ),
                                  Text(
                                    officeTimeFrom.isBefore(time) && officeTimeTo.isAfter(time)?"Open":"Close",
                                    style: TextStyle(fontSize: 1.7.h, color: Colors.red,fontWeight: FontWeight.w400),
                                  ),
                                    
                                  SizedBox(width: 2.w,),
                                    
                                  Text(
                                    '${officeFrom.format(context)} To ${officeTo.format(context)}',
                                    style: TextStyle(
                                      fontSize: 1.7.h,
                                    ),
                                  ),
                                ],
                              ),
                                    
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(ConstIcon.phoneSvg),
                                  SizedBox(
                                    width: 02.w,
                                  ),
                                  Text(
                                    model.mobileNumber!,
                                    style: TextStyle(fontSize: 1.7.h),
                                  ),
                                ],
                              ),
                                    
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(ConstIcon.globeSvg),
                                  SizedBox(
                                    width: 02.w,
                                  ),
                                  InkWell(
                                    onTap: ()=>userController.openClinicWebsite(model.website!),
                                    child: Text(
                                      model.website!,
                                      style: TextStyle(fontSize: 1.7.h,decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ],
                              ),
                                    
                                    
                              SizedBox(height: 1.h,),
                                    
                                    
                              SizedBox(
                                  width: 90.w,
                                  child: Text('Description: ${model.clinicDescription!}',style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp
                                  ),)),
                                    
                              SizedBox(
                                height: 0.5.h,
                              ),
                                    
                                    
                                    
                                    
                            ],
                          ),
                        ),
                                    
                        // SizedBox(
                        //   width: 90.w,
                        //   child: Text(
                        //     'Services',
                        //     style: GoogleFonts.dmSans(
                        //         fontSize: 18.sp, fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        SizedBox(
                          height: 1.3.h,
                        ),
                                    
                        SizedBox(
                          width: 90.w,
                          child: Text(
                            'Services',
                            style: GoogleFonts.dmSans(
                                fontSize: 2.5.h, fontWeight: FontWeight.bold),
                          ),
                        ),

                        SizedBox(
                          height: 1.3.h,
                        ),

                        // ClinicDetailsScreenBoxes(),
                        Wrap(
                            spacing: 0.3.w,
                            runSpacing: 2.w,
                          children:List.generate(model.serviceCategory!.length, (index){
                            return OneByOneBox(text: model.serviceCategory![index],);
                          })
                        ),

                        // GridView.builder(
                        //   shrinkWrap: true,
                        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                        //     itemBuilder: (context, index){
                        //   return OneByOneBox(text: model.serviceCategory![index],);
                        // }),


                        // ListView.builder(
                        //   physics: ScrollPhysics(),
                        //   shrinkWrap: true,
                        //   // scrollDirection: Axis.horizontal,
                        //     itemCount: model.serviceCategory!.length,
                        //     itemBuilder: (context, index){
                        //   return OneByOneBox(text: model.serviceCategory![index],);
                        // }),


                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 90.w,
                          child: Text(
                            'Location',
                            style: GoogleFonts.dmSans(
                                fontSize: 2.5.h, fontWeight: FontWeight.bold),
                          ),
                        ),
                                    
                        SizedBox(
                          height: 0.5.h,
                        ),
                                    
                        SizedBox(
                          height: 18.h,
                          width: ConstPadding.resNinetyWidth(context),
                          child: Image.asset(ConstImg.location,fit: BoxFit.cover,),
                                    
                        ),
                                    
                                    
                        SizedBox(height: 2.h,),
                                    
                                    
                                    
                        InkWell(
                          onTap: ()async {
                            var location = Location();
                            if(!await location.serviceEnabled()){
                            location.requestService();
                            }
                            else{
                              userController.openMap(model.lat! ,model.long!);
                            }
                          },
                          child: Container(
                            height: 05.5.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                                color:ConstColor.blueConstColor,
                                borderRadius: BorderRadius.circular(08.w)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(ConstIcon.compassSvg),
                                SizedBox(width: 3.w,),
                                Text(
                                  'Get Direction',
                                  style: GoogleFonts.dmSans(fontSize: 2.2.h,color:Colors.white,fontWeight:FontWeight.bold),
                                ),
                              ],
                            ),
                                    
                          ),
                        ),



                        SizedBox(height: 2.5.h,)
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                      ],
                    ),
                  ),
                )

            )
        )
    );
  }
}
