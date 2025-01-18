import 'package:clinics_app/core/constants/const_text_styles.dart';
import 'package:clinics_app/features/auth/presentatation/manager/auth_controller.dart';
import 'package:clinics_app/features/auth/presentatation/screens/forgot_password.dart';
import 'package:clinics_app/features/auth/presentatation/widgets/auth_custom_textfield.dart';
import 'package:clinics_app/features/auth/presentatation/widgets/auth_header.dart';
import 'package:clinics_app/features/auth/presentatation/widgets/passwod_textfield.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_padding.dart';
import '../../../../core/utils/injections.dart';
import '../../../user/presentation/widgets/custom_blue_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final controller = sl<AuthController>();

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
            width: 100*h,
            height: 100*h,
            color: Colors.white,
            child: Form(
              key: controller.signInFormKey,
              child: Column(
                children: [

                  const AuthHeader(text: 'Sign In',),

                  SizedBox(height: 15*h,),
                  AuthCustomTextField(
                    controller: controller.signInEmailController,
                    validator: controller.validateEmailField,
                    text: 'Email',
                    hintText: 'Enter Your Email',
                  ),
                  SizedBox(
                    height: 1*h,
                  ),
                   PasswordTextField(
                    controller: controller.signInPasswordController,
                    validator: controller.validator,
                    text: 'Password',
                    hintText: 'Enter Your Password',
                    isPass: true,
                  ),
                  SizedBox(
                    height: 1*h,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ForgotPassword();
                        }));
                      },
                      child: Text('Forgot Password?  ',
                          style: ConstTextStyles.textButtonStyle)),
                  SizedBox(
                    height: 1*h,
                  ),
                  CustomBlueButton(text: 'Sign In', onPressed: () {
                    if(controller.signInFormKey.currentState!.validate()){
                      controller.signInSubmit(context);
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
