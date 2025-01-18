import 'dart:async';
import 'package:clinics_app/core/constants/const_img.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:clinics_app/features/user/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/utils/injections.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    sl<UserController>().loadUserData();
    loadScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100.h,
      width: 100.w,
      color: Colors.white,
      child:Image.asset(ConstImg.splashScreenLogo),
    );
  }


  void loadScreen() {
    Timer(const Duration(seconds: 5) , (){
      Get.offAll( const HomeScreen());
    });

  }

}
