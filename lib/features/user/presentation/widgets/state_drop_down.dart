import 'package:clinics_app/core/constants/const_padding.dart';
import 'package:clinics_app/core/constants/states_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_text_styles.dart';
import '../../../../core/controllers/home_controllers.dart';
import '../../../../core/utils/injections.dart';

class StateDropDownMenu extends StatelessWidget {



   StateDropDownMenu({
    super.key,

  });

  final controller = sl<HomeController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height/100;
    double w = size.width/100;
    return Obx(()=>
      SizedBox(
        width: 90.w,
      child: DropdownButtonFormField2(
        // value: widget.selected,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          contentPadding: EdgeInsets.zero,
          fillColor: Colors.grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(03.w),
          ),
        ),
        hint: Text(
          controller.selectedStateModel.value.title.toString(),
          style:  TextStyle(fontSize: 1.7.h, color: Colors.black),
        ),
        items: StatesModel.statesModelList
            .map((item) => DropdownMenuItem<StatesModel>(
          value: item,
          child: Text(
            item.title.toString(),
            style:  TextStyle(
                fontSize: 2.h,
                color: Colors.black
            ),
          ),
        ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select Value.';
          }
          return null;
        },
        onChanged: (mdl)=>controller.setSelectedStateModel(mdl!),
        onSaved: (value) {
          controller.setSelectedStateModel(value!);
        },
        buttonStyleData:  ButtonStyleData(
          height: 6.h,
          padding: const EdgeInsets.only(left: 20, right: 10),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          iconSize: 30,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.h),
              color: Colors.white
          ),
        ),
      ),
      ),
    );
  }
}

String? selectedValue;
