import 'package:clinics_app/core/controllers/home_controllers.dart';
import 'package:clinics_app/features/auth/presentatation/screens/sign_in_screen.dart';
import 'package:clinics_app/features/auth/presentatation/screens/sign_up_screen.dart';
import 'package:clinics_app/features/user/presentation/widgets/clinic_tab_widgets/clinic_tab_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_padding.dart';
import '../../../../../core/utils/injections.dart';
import '../../../../auth/presentatation/manager/auth_controller.dart';
import '../../widgets/image_picker_dialog.dart';
import '../../widgets/profile_button.dart';
import '../../widgets/profile_listtile.dart';



class AdminProfileTab extends StatelessWidget {

   AdminProfileTab({super.key});

  final controller = sl<AuthController>();


  @override
  Widget build(BuildContext context) {
    return
      Obx(()=> controller.isResultLoaded.value?
        const Center(child: CircularProgressIndicator())
        :
        SafeArea(
      child:  Scaffold(
        body: Container(
          padding: ConstPadding.resPadding(context),
          width: 100.w,
          height: 100.h,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 1.h,),
          ClinicTabHeader(text: 'Profile Screen', onPressed: ()=> sl<HomeController>().setAdminHomeTabIndex(0)),
            SizedBox(
              height: 35.h,
              width: 95.w,
              child:
              Center(
                child: Stack(
                  children: [

                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 30.h,
                      width: 30.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 5,color: Colors.black)
                      ),
                      child: Container(
                          margin: EdgeInsets.all(01.w),
                          height: 29.h,
                          width: 29.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: controller.currUser!.imgUrl!.isEmpty ?
                          Image.asset(
                            'assets/images/avatar.jpg',fit: BoxFit.cover,)
                              :
                          Image.network(
                            controller.currUser!.imgUrl!,fit: BoxFit.cover,)
                      ),


                    ),

                    Positioned(
                      right: 2.h,
                      bottom: 1.h,
                      child: CircleAvatar(
                          radius: 3.h,
                          child: IconButton(
                            onPressed: () {
                              controller.getUserPicture(
                                  context, ImageSource.gallery);
                              // showDialog(context: context, builder: (context){
                              //   return ImageDialogBox();
                              // });
                            },
                            icon: const Icon(
                              Icons.camera_alt_rounded,
                              size: 30,
                            ),
                          )),
                    )
                  ],
                ),
              ),

            ),
            SizedBox(
              height: 3.h,
            ),

              Padding(
                padding: EdgeInsets.all(1.h),
                child: Column(
                  children: [
                    ProfileListTile(
                        title: 'Name:  ',
                        text: controller.currUser!.name!
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),

                    ProfileListTile(
                        title: 'Email:  ',
                        text: controller.currUser!.email!
                    ),

                  ],
                ),
              ),


              ProfileButton(
                icon: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                text: 'Change Password',
                onPressed: () {},
              ),

              SizedBox(
                height: 1.5.h,
              ),

              ProfileButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                text: 'Add New Admin',
                onPressed: () {
                  Get.to(SignUpScreen());
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              ProfileButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  text: 'Log Out',
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Get.offAll( SignInScreen());
                  }
              ),
            ],
          ),
        ),
      ),
    )
      );
  }
}
