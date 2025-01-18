import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants/const_icons.dart';


class ClinicTabTwoMainContainer extends StatelessWidget {
  final String image, title, location, openOrClose, timing, mobile;

  const ClinicTabTwoMainContainer({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.openOrClose,
    required this.timing,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90.w,
          height: 32.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(05.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.03),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(2.w),
            child: Column(
              children: [
                Container(
                  height: 15.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.w),
                        topLeft: Radius.circular(5.w)),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: 90.w,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                const Divider(),
                SizedBox(
                  height: 0.5.h,
                ),
                Row(
                  children: [
                    Image.asset(ConstIcon.locationIcon),
                    SizedBox(
                      width: 02.w,
                    ),
                    Text(
                      location,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Image.asset(ConstIcon.clock),
                    SizedBox(
                      width: 02.w,
                    ),
                    Text(
                      openOrClose,
                      style: TextStyle(fontSize: 14.sp, color: Colors.red),
                    ),
                    Text(
                   timing,
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Image.asset(ConstIcon.phone),
                    SizedBox(
                      width: 02.w,
                    ),
                    Text(
                     mobile,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),


        SizedBox(height: 1.h,),
      ],
    );
  }
}
