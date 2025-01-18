import 'package:clinics_app/features/admin/presentation/manager/check_provider.dart';
import 'package:clinics_app/features/auth/presentatation/screens/splash_screen/splash_screen.dart';
import 'package:clinics_app/features/user/presentation/screens/tabs/check_paggeee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/utils/main_method.dart';

void main() async {

  await MainMethod.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context , orientation , screenType ) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>CheckProvider())
          ],
          child: GetMaterialApp(
              title: 'Safe Use',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home:  SplashScreen(),
            builder: EasyLoading.init(),
          ),
        );
      },
    );
  }
}


