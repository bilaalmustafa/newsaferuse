import 'package:clinics_app/features/admin/presentation/manager/admin_controller.dart';
import 'package:clinics_app/features/admin/presentation/screen/tabs/update_clinic_details.dart';
import 'package:clinics_app/features/admin/presentation/widgets/delete_dialog.dart';
import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_icons.dart';
import '../../../../core/constants/const_img.dart';
import '../../../../core/utils/injections.dart';
import '../../../user/domain/entities/clinic_details_model.dart';
import '../../../user/presentation/screens/tabs/clinic_detalis_screen.dart';

class AdminClinicTabContainer extends StatelessWidget {
  final ClinicDetailsModel model;
   AdminClinicTabContainer({
    super.key,
    required this.model,
  });


  final userController = sl<UserController>();
  final adminController = sl<AdminController>();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // double h  = size.height/100;
    return InkWell(
      onTap: ()=> Get.to(ClinicDetailsScreen(model: model,)),
      child:Obx(()=>
      userController.isAllFunctionLoading.value ?
          const Center(
            child: CircularProgressIndicator(),
          )
          :
          Column(
            children: [
              Container(
                width: 90.w,
                // height: 22*h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.h),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                          width: 30.w,
                          height: 16.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5.w),
                                topLeft: Radius.circular(5.w)),
                          ),
                          child: model.clinicImages!.isEmpty ?
                          Image.asset(ConstImg.clinicTabImageOne,fit: BoxFit.cover,):

                          Image.network(model.clinicImages![0])
                      ),
                    ),

                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        width: 48.w,
                        child: Padding(
                          padding: EdgeInsets.all(2.w),
                          child: Column(
                            children: [
                              Text(
                                model.title!,
                                style: TextStyle(fontSize: 2.2.h),
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
                                  Image.asset(ConstIcon.locationIconSvg),
                                  SizedBox(
                                    width: 02.w,
                                  ),
                                  Text(
                                    model.address!,
                                    style: TextStyle(fontSize: 1.8.h),
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
                                    'closed',
                                    style: TextStyle(fontSize: 1.8.h, color: Colors.red),
                                  ),

                                  SizedBox(
                                    width: 02.w,
                                  ),

                                  Text(
                                    'model.officeTime!',
                                    style: TextStyle(
                                      fontSize: 1.8.h,
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
                                    model.mobileNumber!,
                                    style: TextStyle(fontSize: 1.8.h),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 07.w,
                        child: Padding(
                          padding:  EdgeInsets.only(top: 5.w, bottom: 5.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(onPressed: (){
                                adminController.oldData(model);
                                Get.to(UpdateClinicDetails(model: model));
                              }, icon: const Icon(Icons.edit)),



                              IconButton(onPressed: (){
                                showDialog(context: context, builder: (context){
                                  return DeleteDialog(onYes: () async {
                                    await adminController.deleteClinicController(context, model).whenComplete(()=>Navigator.of(context).pop());
                                  }, description: 'Are you sure to delete the clinic');
                                });
                              }, icon: const Icon(Icons.delete,color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),


              SizedBox(height: 1.h,),
            ],
          ))
    );
  }

}
