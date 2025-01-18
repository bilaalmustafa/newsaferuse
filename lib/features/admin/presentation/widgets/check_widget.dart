import 'dart:io';

import 'package:clinics_app/features/admin/presentation/manager/check_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CheckWidget extends StatelessWidget {
   const CheckWidget ({super.key});



  @override
  Widget build(BuildContext context) {
    return Consumer<CheckProvider>(builder: ( context, controller ,child) {
      List<Container> containerss = List.generate(controller.asdfasdf.length+1 , (index){
        return
          index == controller.asdfasdf.length ?
          Container(
            height: 12.h,
            width: 25.w,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.blue,

            ),
            child: InkWell(
              onTap:(){
                controller.selectImages('gallery');
              },
              child: Container(
                // width: 24.w,
                color: Colors.red,
                child: Column(
                  children: [
                    SizedBox(height: 0.5.h,),
                    Icon(Icons.upload,color: Colors.white,size: 5.h,),
                    Center(
                      child: Text( "Click to upload",style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white),
                        // textAlign: TextAlign.center
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
              :
          Container(
            child:
            Stack(
              children: [
                SizedBox(
                  height: 12.h,
                  width: 25.w,
                 child:  Image.memory(
                    controller
                        .asdfasdf[index],
                    fit: BoxFit.cover,
                    // height: 100,
                    // width: 80,
                  ),
                ),
                Positioned(
                  right: -0.3.h,
                  top: -0.3.h,
                  child: InkWell(
                    onTap: () {
                      controller.removeImages(index);
                      print(controller
                          .asdfasdf.length);
                    },
                    child:  CircleAvatar(
                      radius: 02.h,
                      backgroundColor:Colors.red,
                      child: Icon(
                        size: 1.7.h,
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

      });
      return
        Padding(
          padding:  EdgeInsets.only(left: 3.w,right: 3.w),
          child: DottedBorder(
            dashPattern: const [5, 5, 5, 5],
            strokeWidth: 1,
            borderType: BorderType.Rect,
            color: Colors.green,
            child: Container(
              width: 500,
              padding:  EdgeInsets.all(04.w),
              decoration: const BoxDecoration(
                  color: Colors.transparent
              ),
              child: Padding(
                padding:  EdgeInsets.all(1.w),
                child: DottedBorder(
                  stackFit: StackFit.loose,
                  dashPattern: const [5, 5, 5, 5],
                  strokeWidth: 1,
                  color: Colors.grey,
                  child: controller.asdfasdf.isNotEmpty ?
                  Wrap(  spacing: 2.w,
                    runSpacing: 2.w,

                    children: containerss,
                  )

                      :
                  Container(
                    height: 12.h,
                    width: 85.w,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.blue,

                    ),
                    child: InkWell(
                      onTap:(){
                        controller.selectImages('gallery');
                      },
                      child: Container(
                        // width: 24.w,
                        color: Colors.red,
                        child: Column(
                          children: [
                            SizedBox(height: 0.5.h,),
                             Icon(Icons.upload,color: Colors.white,size:5.h,),
                             Center(
                               child: Text( "Click to upload",style: GoogleFonts.dmSans(
                                fontSize: 1.5.h,
                               color: Colors.white),
                                // textAlign: TextAlign.center
                                                           ),
                             ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

    },);

  }
}



