import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/features/user/lacewatch/component/loader/shimmer_placeholder.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/extension.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/gap.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/size.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/theme.dart';
import 'package:clinics_app/features/user/lacewatch/model/drag.dart';
import 'package:flutter/material.dart';

class DrugItem extends StatelessWidget {
  final Drug drug;
  final Function()? onTap;
  const DrugItem({super.key, this.onTap, required this.drug});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(drug.createdAt.format() ?? "Nil", style: context.bodySmall),
              Text(drug.drugName ?? "",
                  style: context.titleMedium
                      .copyWith(color: ConstColor.blueConstColor)),
            ],
          ),
          const Gap(Sizes.s8),
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: ConstColor.white,
                borderRadius: BorderRadius.circular(Sizes.s8),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.s8),
                    child: drug.drugImage == null
                        ? SizedBox(
                            height: context.height * 0.2,
                          )
                        : CachedNetworkImage(
                            height: context.height * 0.2,
                            fit: BoxFit.cover,
                            placeholder: (ctx, _) => ShimmerPlaceHolder(
                              height: context.height * 0.2,
                            ),
                            width: double.infinity,
                            imageUrl: drug.drugImage!,
                          ),
                  ),
                  SizedBox(
                    height: Sizes.s50,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Sizes.s12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(drug.drugSynonyms ?? "",
                              style: context.titleMedium
                                  .copyWith(color: ConstColor.black)),
                          if (drug.isVerified ?? false)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.s8, vertical: Sizes.s4),
                              decoration: BoxDecoration(
                                color: ConstColor.primary,
                                borderRadius: BorderRadius.circular(Sizes.s4),
                              ),
                              child: Text(
                                "Verified",
                                style: context.bodySmall.copyWith(
                                    fontSize: Sizes.s10,
                                    color: ConstColor.white),
                              ),
                            )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
