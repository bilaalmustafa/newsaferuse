import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/features/user/lacewatch/component/shared_appbar.dart';
import 'package:clinics_app/features/user/lacewatch/component/shared_submitted_button.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/extension.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/gap.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/size.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/theme.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/validator.dart';
import 'package:clinics_app/features/user/lacewatch/signup_screen.dart';
import 'package:clinics_app/features/user/lacewatch/viewModel/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  bool _validateAndSaveForm() {
    var form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.homeBackground,
      appBar: const SharedAppbar(
        title: "Sign in",
        backgroundColor: ConstColor.homeBackground,
        desc: "Sign in to your account to post a testing result",
      ),
      bottomNavigationBar: Container(
        height: context.height * 0.1,
        alignment: Alignment.topCenter,
        child: RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: context.bodyMedium,
            children: [
              TextSpan(
                text: "Sign up!",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChangeNotifierProvider(
                            create: (_) => AuthViewmodel(),
                            child: const SignupScreen(),
                          ),
                        ));

                  //  Navigator.pushReplacementNamed(context, Routes.signUp);
                  },
                style: context.titleMedium.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(Sizes.s30),
                Text(
                  "Email",
                  style: context.titleMedium.copyWith(
                    color: ConstColor.black2422,
                  ),
                ),
                const Gap(Sizes.s4),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) => Validator.validateEmail(val),
                  decoration: const InputDecoration(
                    hintText: "Your email",
                  ),
                ),
                const Gap(Sizes.s20),
                Text(
                  "Password",
                  style: context.titleMedium.copyWith(
                    color: ConstColor.black2422,
                  ),
                ),
                const Gap(Sizes.s4),
                TextFormField(
                  controller: _passController,
                  obscureText: true,
                  validator: (val) => Validator.passwordCorrect(val),
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                ),
                const Gap(Sizes.s4),
                TextButton(
                    onPressed: () {},
                    // Navigator.pushNamed(context, Routes.resetPass),
                    child: const Text("Forgot Password?")),
                const Gap(Sizes.s30),
                Consumer<AuthViewmodel>(builder: (context, vm, _) {
                  return SharedSubmitButton(
                    loading: vm.isLoading,
                    onPressed: () async {
                      if (_validateAndSaveForm()) {
                        User? user = await vm.signIn(
                          _emailController.text,
                          _passController.text,
                        );
                        if (user != null && context.mounted) {
                          Navigator.pop(context);
                          Fluttertoast.showToast(msg: "Signin Successfully");
                        }
                      }
                    },
                    width: double.infinity,
                    height: Sizes.s54,
                    title: "Sign in",
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
