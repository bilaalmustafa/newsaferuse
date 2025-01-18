import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConstPadding {
  static EdgeInsets resPadding(context) {
    double width = MediaQuery.sizeOf(context).width;

    double padding = width < 600
        ? width * .02
        : width > 600 && width < 1000
            ? width * .2
            : width > 1000
                ? width * .3
                : width * .02;
    return EdgeInsets.symmetric(horizontal: padding);
  }

  static double resEightyWidth(context) {
    double width = MediaQuery.sizeOf(context).width;

    double widddd = width < 600
        ? 80.w
        : width > 600 && width < 1000
            ? 50.w
            : width > 1000
                ? 30.w
                :  80.w;
    return widddd;
  }  static double resCustomWidth(context,double www) {
    double width = MediaQuery.sizeOf(context).width;

    double widddd = width < 600
        ? 80.w/www
        : width > 600 && width < 1000
            ? 50.w/www
            : width > 1000
                ? 30.w/www
                :  80.w/www;
    return widddd;
  }



  static double resNinetyWidth(context) {
    double width = MediaQuery.sizeOf(context).width;

    double widddd = width < 600
        ? 90.w
        : width > 600 && width < 1000
        ? 60.w
        : width > 1000
        ? 40.w
        :  90.w;
    return widddd;
  }


  static EdgeInsets resPaddingButtons(context) {
    double width = MediaQuery.sizeOf(context).width;

    double padding = width < 600
        ? width * .15
        : width > 600 && width < 1000
            ? width * .07
            : width > 1000
                ? width * .05
                : width * .1;
    return EdgeInsets.symmetric(horizontal: padding);
  }
  static double resWidthListTile(context) {
    double width = MediaQuery.sizeOf(context).width;

    double widthX = width < 600
        ? width *.8
        : width > 600 && width < 1000
            ? width * .6
            : width > 1000
                ? width * .5
                : width * .8;
    return widthX;
  }





}
