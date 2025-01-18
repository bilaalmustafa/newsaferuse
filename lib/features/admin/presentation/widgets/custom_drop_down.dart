import 'package:clinics_app/core/constants/const_padding.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_text_styles.dart';

class CustomDropDownMenu extends StatefulWidget {
  final String text;
  final Function(String?)? onChanged;
  final List<String> items;


  const CustomDropDownMenu({
    super.key,
    required this.text,
    required this.items,
    required this.onChanged,
  });

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

String? selectedValue;

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height/100;
    double w = size.width/100;
    return SizedBox(
      width: ConstPadding.resEightyWidth(context),
      // height: 6.5.h,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.text,
              style:ConstTextStyles.titleTextStyle,
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          DropdownButtonFormField2(
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
              widget.text,
              style:  TextStyle(fontSize: 1.7.h, color: Colors.black),
            ),
            items: widget.items
                .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style:  TextStyle(
                    fontSize: 2.h,
                    color: Colors.black
                ),
              ),
            ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select ${widget.text}.';
              }
              return null;
            },
            onChanged: widget.onChanged,
            onSaved: (value) {
              selectedValue = value.toString();
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
        ],
      ),
    );
  }
}
