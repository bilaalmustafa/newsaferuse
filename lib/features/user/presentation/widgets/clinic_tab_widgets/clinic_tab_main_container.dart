import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_icons.dart';
import '../../../domain/entities/clinic_details_model.dart';
import '../../screens/tabs/clinic_detalis_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';



class ClinicTabMainContainer extends StatelessWidget {
  final ClinicDetailsModel model;

  const ClinicTabMainContainer({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {

    DateTime time = DateTime.now();
    DateTime officeTimeFrom=DateTime(time.year,time.month,time.day,model.fromHour!,model.fromMinute!);
    DateTime officeTimeTo=DateTime(time.year,time.month,time.day,model.toHour!,model.toMinute!);

    TimeOfDay officeFrom = TimeOfDay(hour: model.fromHour!, minute: model.fromMinute!);
    TimeOfDay officeTo = TimeOfDay(hour: model.toHour!, minute: model.toMinute!);

    return InkWell(
      onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return  ClinicDetailsScreen(model: model,);
      })),
      child: Column(
        children: [
          Container(
            width: 90.w,
            height: 18.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(05.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.w),
                        topLeft: Radius.circular(5.w)),
                    image: DecorationImage(
                      image: NetworkImage(model.clinicImages![0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 55.w,
                  child: Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            model.title!,
                            style: TextStyle(fontSize: 2.h),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            // Image.asset(ConstIcon.locationIcon),
                            SvgPicture.asset(ConstIcon.locationIconSvg),
                            SizedBox(
                              width: 02.w,
                            ),
                            Text(
                              model.address!.length.isGreaterThan(25)? '${model.address!.substring(0,25)}...' : model.address.toString(),
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            // Image.asset(ConstIcon.clock),
                            SvgPicture.asset(ConstIcon.clockSvg),
                            SizedBox(
                              width: 02.w,
                            ),
                            Text(
                              officeTimeFrom.isBefore(time) && officeTimeTo.isAfter(time)?"Open":"Close",
                              style: TextStyle(fontSize: 14.sp, color: Colors.red),
                            ),

                            SizedBox(width: 1.w),

                            Text(
                              '${officeFrom.format(context)} To ${officeTo.format(context)}',
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
                            // Image.asset(ConstIcon.phone),
                            SvgPicture.asset(ConstIcon.phoneSvg),
                            SizedBox(
                              width: 02.w,
                            ),
                            Text(
                              model.mobileNumber!,
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),


          SizedBox(height: 1.h,),
        ],
      ),
    );
  }


}

