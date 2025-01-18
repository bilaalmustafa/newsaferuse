import 'package:clinics_app/features/admin/presentation/manager/check_provider.dart';
import 'package:clinics_app/features/admin/presentation/widgets/description_text_field.dart';
import 'package:clinics_app/features/user/presentation/widgets/clinic_tab_widgets/clinic_tab_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_padding.dart';
import '../../../../core/utils/injections.dart';
import '../../../auth/presentatation/widgets/auth_custom_textfield.dart';
import '../../../user/presentation/widgets/custom_blue_button.dart';
import '../manager/admin_controller.dart';
import '../widgets/select_photo_container.dart';

class AddNewDonation extends StatelessWidget {
  AddNewDonation({super.key});

  final controller = sl<AdminController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ConstPadding.resPadding(context),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: 100.h,
            height: 100.h,
            color: Colors.white,
            child: Form(
              key: controller.addNewDonationFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 2.h,),

                     ClinicTabHeader(text: 'Add New Donation',onPressed: ()=> Get.back(),),


                    SizedBox(height: 2.h,),

                    const SelectPhotoContainer(),

                    SizedBox(height: 2.h,),
                    AuthCustomTextField(
                      controller: controller.donationTitleController,
                      validator: controller.validator,
                      text: 'Donation Title',
                      hintText: 'Enter Donation Title',
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    DescriptionTextField(
                      controller: controller.donationDescriptionController,
                      validator: controller.validator,
                      text: 'Donation Description',
                      hintText: 'Enter Donation Description',
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomBlueButton(
                        text: 'Add New Donation',
                        onPressed: () {
                          if (controller.addNewDonationFormKey.currentState!
                              .validate()) {
                            Provider.of<CheckProvider>(context,listen: false).uploadDonationAndImage(context, controller.donationTitleController.text.trim());
                          }
                        })
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
