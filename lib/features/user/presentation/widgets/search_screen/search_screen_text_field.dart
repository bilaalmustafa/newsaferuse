import 'package:clinics_app/features/user/presentation/manager/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/utils/injections.dart';

class SearchScreenTextField extends StatelessWidget {
  final String hintText;
  final int? maxLength;
  TextEditingController? controller = TextEditingController();
  final String? Function(String?)? validator;
  final String Function(String)? onChanged;

   SearchScreenTextField({super.key, required this.hintText,this.maxLength, this.validator, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
            width: 90.w,
            child: TextFormField(
              onChanged: (value) => onChanged!(value),
              style:  TextStyle(color: Colors.black,decoration: TextDecoration.none,fontSize: 17.sp),
              maxLength: maxLength,
              validator: validator,
              controller: controller,
              decoration: InputDecoration(
                errorStyle:  TextStyle(color: Colors.red,fontSize: 17.sp),
                labelStyle: TextStyle(color: Colors.grey,fontSize: 17.sp),
                hintStyle: TextStyle(color: Colors.grey,fontSize: 18.sp),
                prefixIcon:  Icon(Icons.search,size: 22.sp,),
                contentPadding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 5.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1.w),
                  borderSide:  const BorderSide(
                    color: Colors.black,
                  ),
                ),
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black
                  ),
                  //   borderRadius: BorderRadius.circular(3.w),
                  // ),
                ),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black
                    )
                ),
              ),
            )
        ),

        SizedBox(height: 2.h,)

      ],
    );
  }
}
