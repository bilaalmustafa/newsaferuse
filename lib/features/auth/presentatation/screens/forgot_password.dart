import 'package:clinics_app/core/constants/const_text_styles.dart';
import 'package:clinics_app/features/auth/presentatation/manager/auth_controller.dart';
import 'package:clinics_app/features/auth/presentatation/widgets/auth_custom_textfield.dart';
import 'package:clinics_app/features/auth/presentatation/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_padding.dart';
import '../../../../core/utils/injections.dart';
import '../../../user/presentation/widgets/custom_blue_button.dart';


class ForgotPassword extends StatelessWidget {
   ForgotPassword({super.key});

  final controller = sl<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ConstPadding.resPadding(context),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Form(
              key: controller.forgotPasswordFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                   const AuthHeader(text: 'Forgot Password'),
                    SizedBox(
                      height: 70.h,
                      width: 100.w,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text('Its All Right',
                              style: ConstTextStyles.forgotPassword),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text('Enter the email address associated',
                              style: ConstTextStyles.forgotPasswordText),
                          Text('with your account',
                              style: ConstTextStyles.forgotPasswordText),
                          SizedBox(
                            height: 1.h,
                          ),
                          AuthCustomTextField(
                            controller: controller.forgotPasswordEmailController,
                            validator: controller.validateEmailField,
                            text: 'Email',
                            hintText: 'Enter Your email',
                          ),
                          SizedBox(
                            height: 4.h,
                          ),

                          CustomBlueButton(text: 'Send Email', onPressed: (){
                            if(controller.forgotPasswordFormKey.currentState!.validate()){
                              controller.forgotPasswordSubmit(context);
                            }
                          }),

                          TextButton(
                              onPressed: () {
                                if(controller.forgotPasswordFormKey.currentState!.validate()){
                                  controller.forgotPasswordSubmit(context);
                                }
                              },
                              child: Text('Resend Email?  ',
                                  style: ConstTextStyles.textButtonStyle)),
                        ],
                      ),
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
