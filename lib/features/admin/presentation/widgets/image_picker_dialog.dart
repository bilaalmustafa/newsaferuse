import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/const_decoration.dart';
import '../../../../core/utils/injections.dart';
import '../../../auth/presentatation/manager/auth_controller.dart';
import '../../../user/presentation/widgets/custom_blue_button.dart';


class ImageDialogBox extends StatelessWidget {
   ImageDialogBox({super.key});
  final controller = sl<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 80.w,
        height: 30.h,
        child: Container(
          decoration: ConstDecoration.authScreenDecoration,
          padding: EdgeInsets.all(5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Column(
                  children: [
                    CustomBlueButton(
                      text: 'Gallery',
                      // color: ConstColors.blueColor,
                      onPressed: () async {
                        controller.getUserPicture(
                            context, ImageSource.gallery);
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomBlueButton(
                        text: 'Camera',
                        // color: ConstColors.blueColor,
                        onPressed: () async {
                          controller.getUserPicture(context, ImageSource.camera);
                        }
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomBlueButton(
                        text: 'Cancel',
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
