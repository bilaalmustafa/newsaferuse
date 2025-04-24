import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/gap.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/size.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class SharedAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onLeading;
  final String? desc;
  final Color backgroundColor;
  const SharedAppbar({super.key, required this.title, this.onLeading, this.desc, this.backgroundColor = ConstColor.white});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      titleSpacing: Sizes.s0,
      elevation: 0,
      leading: IconButton(
        onPressed: onLeading ?? () => Navigator.pop(context),
        icon: const Icon(
          Symbols.arrow_back_ios_new,
          weight: 600,
          size: Sizes.s20,
          color: ConstColor.primary,
        ),
      ),
      title: desc == null
          ? Text(
              title,
              style: context.displaySmall,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.displaySmall,
                ),
                const Gap(Sizes.s8),
                Text(
                  desc ?? "",
                  style: context.bodySmall.copyWith(color: ConstColor.primary),
                ),
              ],
            ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, Sizes.s60);
}
