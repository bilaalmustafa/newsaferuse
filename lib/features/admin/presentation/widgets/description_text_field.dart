
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_padding.dart';
import '../../../../core/constants/const_text_styles.dart';
import '../../../auth/presentatation/widgets/passwod_textfield.dart';

class DescriptionTextField extends StatelessWidget {
  final String text, hintText;
  final Icon? prefix;
  final IconButton? suffixButton;
  late final bool obscureText;
  final TextInputType textInputType;
  final Icon? suffix;
  final int? maxLength;
  final bool isPass;
  TextEditingController? controller = TextEditingController();
  final String? Function(String?)? validator;


  DescriptionTextField({
    super.key,
    required this.text,
    required this.hintText,
    this.obscureText = false,
    this.prefix,
    this.suffixButton,
    this.textInputType = TextInputType.text,
    this.suffix,
    this.maxLength,
    this.validator,
    this.isPass = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height/100;
    double w = size.width/100;
    return SizedBox(
      width: ConstPadding.resEightyWidth(context),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              text,
              style:ConstTextStyles.titleTextStyle,
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          TextFormField(
            maxLines: 5,
            maxLength: maxLength,
            validator: validator,
            keyboardType: textInputType,
            obscureText: obscureText,
            controller: controller,
            style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 1.8.h),
            decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 1.8.h),
                labelStyle: TextStyle(color: Colors.black, fontSize: 1.8.h),
                hintStyle: TextStyle(color: Colors.black, fontSize: 1.8.h),
                suffix: suffixButton,
                hintText: hintText,
                prefixIcon: prefix,
                suffixIcon: suffix,
                contentPadding:
                EdgeInsets.symmetric(vertical: 1.6*h, horizontal: 2.5.h),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(3.w),
                //   borderSide:  const BorderSide(
                //     color: Colors.black,
                //   ),
                // ),
                focusedBorder: buildOutlineInputBorder(),
                border: buildOutlineInputBorder(),
                enabledBorder: buildOutlineInputBorder(),
                errorBorder: buildOutlineInputBorder(isRed: true),
                focusedErrorBorder: buildOutlineInputBorder(isRed: true),
                disabledBorder: buildOutlineInputBorder(),
                fillColor: Colors.grey,
                filled: true),
          ),
        ],
      ),
    );
  }
}
