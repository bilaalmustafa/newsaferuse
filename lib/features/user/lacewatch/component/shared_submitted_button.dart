import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/size.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/theme.dart';
import 'package:flutter/material.dart';

class SharedSubmitButton extends StatelessWidget {
  final Widget? child;
  final String title;
  final Function()? onPressed;
  final double marginHorizontal;
  final double paddingVeritical;
  final double paddingHorizontal;
  final double radius;
  final Color color;
  final Color? borderColor;
  final Color textColor;
  final double elevalion;
  final double? width;
  final double? height;
  final bool loading;
  final bool isDisabled;

  const SharedSubmitButton({
    super.key,
    this.child,
    required this.onPressed,
    this.color = ConstColor.primary,
    this.textColor = ConstColor.white,
    this.elevalion = 0,
    this.marginHorizontal = 0.0,
    this.paddingHorizontal = Sizes.s16,
    this.width,
    this.paddingVeritical = Sizes.s12,
    this.isDisabled = false,
    this.title = 'Next',
    this.radius = Sizes.s4,
    this.loading = false,
    this.height,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: marginHorizontal),
      child: SizedBox(
        height: 50,
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            minimumSize:
                width != null || height != null ? Size(width!, height!) : null,
            side: BorderSide(
              color: borderColor ?? color, // Border color
              width: Sizes.s1, // Border width
            ),
            backgroundColor: isDisabled ? ConstColor.greyd9d9d9 : color,
            elevation: elevalion,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.symmetric(
                vertical: paddingVeritical, horizontal: paddingHorizontal),
            foregroundColor: !isDisabled ? textColor : ConstColor.white,
            textStyle: context.bodyMedium.copyWith(color: textColor),
          ),
          child: child ??
              (loading
                  ? const Center(
                      child: SizedBox(
                        width: Sizes.s26,
                        child: CircularProgressIndicator(
                          color: ConstColor.white,
                        ),
                      ),
                    )
                  : Text(
                      title,
                      style: context.headlineSmall
                          .copyWith(fontSize: Sizes.s16, color: textColor),
                    )),
        ),
      ),
    );
  }
}
