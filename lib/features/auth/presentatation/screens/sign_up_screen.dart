import 'package:clinics_app/features/auth/presentatation/manager/auth_controller.dart';
import 'package:clinics_app/features/user/presentation/widgets/clinic_tab_widgets/clinic_tab_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_padding.dart';
import '../../../../core/utils/injections.dart';
import '../../../user/presentation/widgets/custom_blue_button.dart';
import '../widgets/auth_custom_textfield.dart';
import '../widgets/passwod_textfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = sl<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ConstPadding.resPadding(context),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: 100.h,
            height: 100.h,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Form(
                key: controller.signUpFormKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    ClinicTabHeader(text: 'Add New Admin', onPressed: ()=> Get.back()),
                    SizedBox(
                      height: 10.h,
                    ),

                    AuthCustomTextField(
                      controller: controller.signUpNameController,
                      validator: controller.validator,
                      text: 'Name',
                      hintText: 'Enter Your Name',
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AuthCustomTextField(
                      controller: controller.signUpEmailController,
                      validator: controller.validateEmailField,
                      text: 'Email',
                      hintText: 'Enter Your Email',
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                     PasswordTextField(
                      controller: controller.signUpPasswordController,
                      validator: controller.validator,
                      text: 'Password',
                      hintText: 'Enter Your Password',
                      isPass: true,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                     PasswordTextField(
                      controller: controller.signUpConfirmPasswordController,
                      validator: controller.validator,
                      text: 'Confirm Password',
                      hintText: 'Confirm Your Password',
                      isPass: true,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomBlueButton(text: 'Sign Up', onPressed: () {
                      if(controller.signUpFormKey.currentState!.validate()){
                        controller.signUpSubmit(context);
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
