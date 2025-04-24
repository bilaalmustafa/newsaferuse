import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/features/user/lacewatch/component/loader/shimmer_placeholder.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/extension.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/gap.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/size.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/theme.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class HomeLoader extends StatelessWidget {
  const HomeLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
      itemBuilder: (context, i) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerPlaceHolder(
                  width: context.width * 0.2,
                ),
                ShimmerPlaceHolder(
                  width: context.width * 0.2,
                ),
              ],
            ),
            const Gap(Sizes.s8),
            Container(
              decoration: BoxDecoration(
                color: ConstColor.white,
                borderRadius: BorderRadius.circular(Sizes.s8),
              ),
              child: Column(
                children: [
                  ShimmerPlaceHolder(
                    height: context.height * 0.2,
                  ),
                  SizedBox(
                    height: Sizes.s50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Sizes.s12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerPlaceHolder(
                            width: context.width * 0.2,
                          ),
                          Shimmer.fromColors(
                            baseColor: ConstColor.greyEEE,
                            highlightColor: ConstColor.white,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: Sizes.s8, vertical: Sizes.s4),
                              decoration: BoxDecoration(
                                color: ConstColor.primary,
                                borderRadius: BorderRadius.circular(Sizes.s4),
                              ),
                              child: Text(
                                "Verified",
                                style: context.bodySmall.copyWith(fontSize: Sizes.s10, color: ConstColor.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Sizes.s20),
    );
  }
}
