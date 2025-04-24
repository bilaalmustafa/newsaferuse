import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceHolder extends StatelessWidget {
  final double height;
  final double? width;

  const ShimmerPlaceHolder({super.key, this.height = Sizes.s16, this.width});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: ConstColor.greyEEE,
      highlightColor: ConstColor.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.s8),
        child: Container(
          color: Colors.grey,
          height: height,
          width: width ?? size.width,
        ),
      ),
    );
  }
}
