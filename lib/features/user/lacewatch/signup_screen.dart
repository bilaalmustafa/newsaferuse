import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/features/user/lacewatch/component/shared_appbar.dart';
import 'package:clinics_app/features/user/lacewatch/component/shared_submitted_button.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/extension.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/gap.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/size.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/theme.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/utils.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/validator.dart';
import 'package:clinics_app/features/user/lacewatch/sign_in_screen.dart';
import 'package:clinics_app/features/user/lacewatch/viewModel/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:clinics_app/features/user/lacewatch/model/user.dart' as u;

import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
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
        title: "Sign up",
        backgroundColor: ConstColor.homeBackground,
        desc: "Create your account to post a testing result",
      ),
      bottomNavigationBar: Container(
        height: context.height * 0.1,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(
              width: context.width * 0.6,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "By signing up, you are agreeing to our ",
                  style: context.bodyMedium,
                  children: [
                    TextSpan(
                      text: "Terms & Conditions",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Utils.launchAppUrl(
                              "https://sites.google.com/view/lacewatch-terms-conditions/home");
                        },
                      style: context.titleMedium.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(Sizes.s20),
          ],
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
                  "Username",
                  style: context.titleMedium.copyWith(
                    color: ConstColor.black2422,
                  ),
                ),
                const Gap(Sizes.s4),
                TextFormField(
                  controller: _usernameController,
                  validator: (val) => Validator.valueExists(val),
                  decoration: const InputDecoration(
                    hintText: "What should we call you ?",
                  ),
                ),
                const Gap(Sizes.s20),
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
                const Gap(Sizes.s20),
                Text(
                  "Confirm Password",
                  style: context.titleMedium.copyWith(
                    color: ConstColor.black2422,
                  ),
                ),
                const Gap(Sizes.s4),
                TextFormField(
                  obscureText: true,
                  validator: (val) => Validator.passwordConfirmed(
                    val,
                    _passController.text,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Confirm Password",
                  ),
                ),
                const Gap(Sizes.s30),
                Consumer<AuthViewmodel>(builder: (context, vm, _) {
                  return SharedSubmitButton(
                    loading: vm.isLoading,
                    onPressed: () async {
                      if (_validateAndSaveForm()) {
                        User? user = await context.read<AuthViewmodel>().signUp(
                            _emailController.text,
                            _passController.text,
                            u.User(
                              username: _usernameController.text,
                              email: _emailController.text,
                              isVerified: false,
                              createdAt: DateTime.now().microsecondsSinceEpoch,
                            ));
                        if (user != null && context.mounted) {
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                            msg: "Please Login to Post testing results",
                          );
                        }
                      }
                    },
                    width: double.infinity,
                    height: Sizes.s54,
                    title: "Sign up",
                  );
                }),
                const Gap(Sizes.s12),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: context.bodyMedium,
                      children: [
                        TextSpan(
                          text: "Sign in!",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChangeNotifierProvider(
                                      create: (_) => AuthViewmodel(),
                                      child: const SigninScreen(),
                                    ),
                                  ));

                              // Navigator.pushReplacementNamed(
                              //     context, Routes.signIn);
                            },
                          style: context.titleMedium.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(Sizes.s10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
