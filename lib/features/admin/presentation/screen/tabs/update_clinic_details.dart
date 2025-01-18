import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/constants/const_padding.dart';
import '../../../../../core/constants/const_strings.dart';
import '../../../../../core/utils/injections.dart';
import '../../../../auth/presentatation/widgets/auth_custom_textfield.dart';
import '../../../../user/domain/entities/clinic_details_model.dart';
import '../../../../user/presentation/widgets/clinic_tab_widgets/clinic_tab_header.dart';
import '../../../../user/presentation/widgets/custom_blue_button.dart';
import '../../manager/admin_controller.dart';
import '../../manager/check_provider.dart';
import '../../widgets/check_widget.dart';
import '../../widgets/custom_drop_down.dart';

class UpdateClinicDetails extends StatelessWidget {

  final ClinicDetailsModel model;

   UpdateClinicDetails({super.key, required this.model});

  final controller = sl<AdminController>();

  @override
  Widget build(BuildContext context) {
    List<Container> containerss = List.generate(model.clinicImages!.length , (index) {
      return Container(
        height: 12.h,
        width: 25.w,
        child: Image.network(model.clinicImages![index]),
      );
    },);

    return Container(
      padding: ConstPadding.resPadding(context),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: 100.h,
            height: 100.h,
            color: Colors.white,
            child: Form(
              key: controller.addNewClinicFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                     ClinicTabHeader(text: 'Update Clinic',onPressed: ()=> Get.back(),),
                    SizedBox(
                      height: 2.h,
                    ),
                   model.clinicImages!.isEmpty ?
                   const CheckWidget():

               Wrap(
                 spacing: 2.w,
                 runSpacing: 2.w,
                 children: containerss,),

                    SizedBox(
                      height: 2.h,
                    ),
                    AuthCustomTextField(
                      controller: controller.clinicTitleController,
                      validator: controller.validator,
                      text: 'Clinic title',
                      hintText: 'Enter Clinic title',
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AuthCustomTextField(
                      controller: controller.clinicLocationController,
                      validator: controller.validator,
                      text: 'Address',
                      hintText: 'Enter Clinic Address',
                    ),
                    SizedBox(
                      height: 1.h,
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
                    CustomDropDownMenu(
                      text: 'Select Category',
                      items: ConstString.categoryList,
                      onChanged: (String? txt) =>
                          controller.setServiceCategory(txt!),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                        width: 80.w,
                        child: CustomBlueButton(
                            text: 'Update  Clinic',
                            onPressed: () async {
                              if (controller.addNewClinicFormKey.currentState!
                                  .validate()) {
                                // controller.addNewClinic(context);
                                await Provider.of<CheckProvider>(context,
                                    listen: false)
                                    .updateAllData(context,model);
                              }
                            })),
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
