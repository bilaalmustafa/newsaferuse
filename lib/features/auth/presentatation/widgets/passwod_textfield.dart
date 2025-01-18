import 'package:clinics_app/core/constants/const_padding.dart';
import 'package:clinics_app/core/constants/const_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class PasswordTextField extends StatefulWidget {
  final String text, hintText;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final bool isPass;
  final Function(String val)? onChange;
  final Function(String? val)? onSave;
  final String? Function(String?)? validator;
  final String type;

  const PasswordTextField(
      {Key? key,
        required this.text,
        required this.hintText,
        this.controller,
        this.textInputType= TextInputType.text,
        this.type = 'other',
        this.isPass = false,
        this.onChange,
        this.onSave, this.validator})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool pass = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pass = widget.isPass;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
   width: ConstPadding.resEightyWidth(context),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.text,
                style: ConstTextStyles.titleTextStyle,)
          ),
          SizedBox(
            height: 0.5.h,
          ),
          TextFormField(
            validator: widget.validator,
            obscureText: pass,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            onChanged: widget.onChange,
            onSaved: widget.onSave,
            style:  TextStyle(color: Colors.black,decoration: TextDecoration.none,fontSize: 1.8.h),
            decoration: InputDecoration(
                errorStyle:  TextStyle(color: Colors.redAccent,fontSize: 1.8.h),
                labelStyle: TextStyle(color: Colors.black,fontSize: 1.8.h),
                hintStyle: TextStyle(color: Colors.black,fontSize: 1.8.h),
                suffixIcon: widget.isPass
                    ? GestureDetector(
                  onTap: () {
                    setState(() {
                      pass = !pass;
                    });
                  },
                  child: pass
                      ? const Icon(Icons.visibility_off_outlined,color: Colors.white,)
                      : const Icon(Icons.visibility_outlined,color: Colors.white,),
                )
                    : null,
                hintText: widget.hintText,
                contentPadding: EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 2.5.h),
                focusedBorder: buildOutlineInputBorder(),
                border: buildOutlineInputBorder(),
                enabledBorder: buildOutlineInputBorder(),
                errorBorder: buildOutlineInputBorder(isRed: true),
                focusedErrorBorder: buildOutlineInputBorder(isRed: true),
                disabledBorder: buildOutlineInputBorder(),
                fillColor: Colors.grey,
                filled: true
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



OutlineInputBorder buildOutlineInputBorder({bool isRed=false}) {
  return OutlineInputBorder(
    borderSide:  BorderSide(
        color:isRed?Colors.redAccent: Colors.grey,
        style:isRed?BorderStyle.none: BorderStyle.solid
    ),
    borderRadius: BorderRadius.circular(2.h),
  );
}