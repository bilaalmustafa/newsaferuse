import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConstDecoration {



  static var authScreenDecoration = BoxDecoration(
    // borderRadius: BorderRadius.only(
    //   topLeft: Radius.circular(05.w),
    //   topRight: Radius.circular(05.w),
    // ),
    color: Colors.white,
    // gradient:  LinearGradient(
    //     colors: [
    //       const Color(0xff082510).withOpacity(0.5),
    //       const Color(0xff032603).withOpacity(0.5),
    //       const Color(0xff222328).withOpacity(0.5),
    //       const Color(0xff10073d).withOpacity(0.5),
    //       const Color(0xff0d1734).withOpacity(0.5),
    //
    //     ],
    //     end: Alignment.topRight,
    //     begin: Alignment.bottomLeft
    // ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade400,
        spreadRadius: 3,
        blurRadius: 5,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );



  static var deleteDialogDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(05.w),
    color: Colors.white,
    // gradient:  LinearGradient(
    //     colors: [
    //       const Color(0xff082510).withOpacity(0.5),
    //       const Color(0xff032603).withOpacity(0.5),
    //       const Color(0xff222328).withOpacity(0.5),
    //       const Color(0xff10073d).withOpacity(0.5),
    //       const Color(0xff0d1734).withOpacity(0.5),
    //
    //     ],
    //     end: Alignment.topRight,
    //     begin: Alignment.bottomLeft
    // ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade400,
        spreadRadius: 3,
        blurRadius: 5,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );
  
  

}