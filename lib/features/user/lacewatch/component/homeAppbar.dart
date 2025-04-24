import 'package:clinics_app/features/user/lacewatch/controller.dart/location_viewModel.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/gap.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/size.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({
    super.key,
    this.address,
  });
  final String? address;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Sizes.s80,
        padding: const EdgeInsets.only(right: Sizes.s20, left: Sizes.s20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const Flexible(
            //   flex: 5,
            //   child: const SharedDynamicIcon(
            //     ImageAssets.logo,
            //     height: Sizes.s50,
            //   ),
            // ),
            const Gap(Sizes.s12),
            Flexible(
              flex: 4,
              child: InkWell(
                onTap: () {},
                // Navigator.pushNamed(context, Routes.locationListing),
                borderRadius: BorderRadius.circular(Sizes.s8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.s8, vertical: Sizes.s4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: Sizes.s20,
                      ),
                      const Gap(Sizes.s8),
                      Flexible(
                        child: Consumer<LocationViewmodel>(
                          builder: (context, provider, _) {
                            return Text(
                              provider.currentAddress,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: const TextStyle(
                                fontSize: Sizes.s14,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: Sizes.s4),
                      const Icon(Icons.arrow_downward, size: Sizes.s20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, Sizes.s80);
}
