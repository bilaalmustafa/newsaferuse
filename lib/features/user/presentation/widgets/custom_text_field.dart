import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget? prefix;
  final IconButton? suffixButton;
  late final bool obscureText;
  final TextInputType textInputType;
  final Icon? suffix;
  final int? maxLength;
  final bool isPass;
  TextEditingController? controller = TextEditingController();
  final String? Function(String?)? validator;

  CustomTextField({
    super.key,
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
    return SizedBox(
      width: 90.w,
      child: Column(
        children: [
          TextFormField(
            maxLength: maxLength,
            validator: validator,
            keyboardType: textInputType,
            obscureText: obscureText,
            controller: controller,
            style:  TextStyle(color: Colors.black,decoration: TextDecoration.none,fontSize: 17.sp),
            decoration: InputDecoration(
              filled: true,
                fillColor: Colors.grey.withOpacity(0.4),
                errorStyle:  TextStyle(color: Colors.red,fontSize: 17.sp),
                labelStyle: TextStyle(color: Colors.grey,fontSize: 17.sp),
                hintStyle: TextStyle(color: Colors.grey,fontSize: 18.sp),
                suffix: suffixButton,
                hintText: hintText,
                prefixIcon: prefix,
                suffixIcon: suffix,
                contentPadding: EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 5.w),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(3.w),
                //   borderSide:  const BorderSide(
                //     color: Colors.black,
                //   ),
                // ),
                border: InputBorder.none
              // focusedBorder: OutlineInputBorder(
              //   borderSide: const BorderSide(
              //       color: Colors.black
              //   ),
              //   borderRadius: BorderRadius.circular(3.w),
              // ),
            ),
          ),

          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}