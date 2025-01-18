
import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/const_decoration.dart';
import '../../../../core/constants/const_padding.dart';




class DeleteDialog extends StatelessWidget {
  final Function() onYes;
  final String description;
  const DeleteDialog({super.key, required this.onYes, required this.description});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: ConstPadding.resPadding(context),
      backgroundColor: Colors.transparent,
      child: SizedBox(
        // padding: ConstPadding.resPadding(context),
        width: 80.w,
        height: 23.5.h,
        child: Stack(
          children: [
            Container(
              // padding: ConstPadding.resPadding(context),
              width: 80.h,
              height: 20.h,
              decoration: ConstDecoration.deleteDialogDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Warning!!',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 2.3.h,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Divider(
                    height: 1.h,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 2.h,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: onYes,
                      child: CircleAvatar(
                        radius: 4.h,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 3.5.h,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 3.h,
                            backgroundColor: ConstColor.blueColor,
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: CircleAvatar(
                        radius: 4.h,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 3.5.h,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 3.h,
                            backgroundColor: Colors.red,
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
