import 'package:clinics_app/core/constants/const_strings.dart';
import 'package:clinics_app/features/admin/presentation/manager/admin_controller.dart';
import 'package:clinics_app/features/admin/presentation/manager/check_provider.dart';
import 'package:clinics_app/features/admin/presentation/widgets/check_widget.dart';
import 'package:clinics_app/features/admin/presentation/widgets/custom_drop_down.dart';
import 'package:clinics_app/features/user/presentation/widgets/clinic_tab_widgets/clinic_tab_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_padding.dart';
import '../../../../core/utils/injections.dart';
import '../../../auth/presentatation/widgets/auth_custom_textfield.dart';
import '../../../user/presentation/widgets/custom_blue_button.dart';

class AddNewClinic extends StatelessWidget {
  AddNewClinic({super.key});

  final controller = sl<AdminController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double  h = size.height/100;
    double  w = size.width/100;
    return Container(
      padding: ConstPadding.resPadding(context),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            // padding: ConstPadding.resPadding(context),
            width: 100*h,
            height: 100*h,
            color: Colors.white,
            child: Form(
              key: controller.addNewClinicFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 1*h,
                    ),
                     ClinicTabHeader(text: 'Add New Clinic', onPressed: ()=> Get.back(),),
                    SizedBox(
                      height: 2*h,
                    ),
                    const CheckWidget(),
                    SizedBox(
                      height: 2*h,
                    ),
                    AuthCustomTextField(
                      controller: controller.clinicTitleController,
                      validator: controller.validator,
                      text: 'Clinic title',
                      hintText: 'Enter Clinic title',
                    ),
                    SizedBox(
                      height: 1*h,
                    ),
                    AuthCustomTextField(
                      controller: controller.clinicLocationController,
                      validator: controller.validator,
                      text: 'Address',
                      hintText: 'Enter Clinic Address',
                    ),
                    SizedBox(
                      height: 1*h,
                    ),
                    AuthCustomTextField(
                      controller: controller.officeTimeController,
                      validator: controller.validator,
                      text: 'Office Time',
                      hintText: 'Enter Clinic Office Time',
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AuthCustomTextField(
                      controller: controller.mobileNumberController,
                      validator: controller.validator,
                      text: 'Mobile Number',
                      hintText: 'Enter Mobile Number',
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    AuthCustomTextField(
                      controller: controller.websiteController,
                      validator: controller.validator,
                      text: 'Website',
                      hintText: 'Enter Clinic Website',
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomDropDownMenu(
                      text: 'Select Category',
                      items: ConstString.categoryList,
                      onChanged: (String? txt) =>
                          controller.setServiceCategory(txt!),
                    ),
                    SizedBox(
                      height: 2*h,
                    ),
                    CustomBlueButton(
                        text: 'Add New Clinic',
                        onPressed: () async {
                          var location = Location();
                          if (controller.addNewClinicFormKey.currentState!
                              .validate()) {
                            if(!await location.serviceEnabled()){
                              location.requestService();
                            }
                            else{
                              await Provider.of<CheckProvider>(context, listen: false).upload(context);
                            }
                            // controller.addNewClinic(context);
                          }
                        }),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
