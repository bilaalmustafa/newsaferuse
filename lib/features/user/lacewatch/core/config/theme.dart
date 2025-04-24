import 'package:clinics_app/core/constants/const_colors.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/font.dart';
import 'package:clinics_app/features/user/lacewatch/core/config/size.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;
  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;
  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;
  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;

  ElevatedButtonThemeData get elevatedButtonTheme => Theme.of(this).elevatedButtonTheme;
  InputDecorationTheme get inputDecoration => Theme.of(this).inputDecorationTheme;
}

ThemeData getApplicationTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: ConstColor.primary),
      primaryColor: ConstColor.primary,
      useMaterial3: true,
      primaryColorLight: ConstColor.primaryLight,
      scaffoldBackgroundColor: ConstColor.white,
      primaryColorDark: ConstColor.primary,
      disabledColor: ConstColor.grey7f7f,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: ConstColor.white,
        surfaceTintColor: null,
      ),
      splashColor: ConstColor.primaryLight,
      cardTheme: const CardTheme(color: ConstColor.white, shadowColor: ConstColor.grey7f7f, elevation: Sizes.s4),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: ConstColor.white,
        elevation: Sizes.s4,
        shadowColor: ConstColor.black333,
        titleTextStyle: getMediumStyle(color: ConstColor.black, fontSize: Sizes.s20).copyWith(letterSpacing: 0.5),
      ),
      iconTheme: const IconThemeData(color: ConstColor.black, fill: 0, weight: 300, opticalSize: 48),
      buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: ConstColor.grey7f7f,
          buttonColor: ConstColor.primary,
          splashColor: ConstColor.primaryE7F),
      radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(ConstColor.primary), materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ConstColor.primary,
          disabledForegroundColor: ConstColor.white,
          disabledBackgroundColor: ConstColor.grey7272,
          textStyle: getMediumStyle(fontSize: Sizes.s16, color: ConstColor.white),
          padding: const EdgeInsets.symmetric(vertical: Sizes.s16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.s12),
          ),
        ),
      ),
      drawerTheme: DrawerThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.s0))),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: ConstColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.s16),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.s8,
              vertical: Sizes.s0,
            ),
            textStyle: getMediumStyle(fontSize: Sizes.s14, color: ConstColor.primary)),
      ),
      textTheme: TextTheme(
          displayLarge: getBoldStyle(color: ConstColor.primary, fontSize: Sizes.s40),
          displayMedium: getBoldStyle(color: ConstColor.primary, fontSize: Sizes.s28),
          displaySmall: getBoldStyle(color: ConstColor.primary, fontSize: Sizes.s18),
          headlineLarge: getSemiBoldStyle(color: ConstColor.primary, fontSize: Sizes.s40),
          headlineMedium: getSemiBoldStyle(color: ConstColor.primary, fontSize: Sizes.s28),
          headlineSmall: getSemiBoldStyle(color: ConstColor.primary, fontSize: Sizes.s18),
          titleLarge: getMediumStyle(color: ConstColor.primary, fontSize: Sizes.s16),
          titleMedium: getMediumStyle(color: ConstColor.primary, fontSize: Sizes.s14),
          titleSmall: getMediumStyle(color: ConstColor.primary, fontSize: Sizes.s12),
          bodyMedium: getRegularStyle(color: ConstColor.black, fontSize: Sizes.s14),
          bodySmall: getRegularStyle(color: ConstColor.black, fontSize: Sizes.s12),
          bodyLarge: getRegularStyle(color: ConstColor.black, fontSize: Sizes.s16)),

      // input decoration theme (text form field)
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.s100)),
        backgroundColor: ConstColor.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: Sizes.s16, vertical: Sizes.s12),
        hintStyle: getRegularStyle(color: ConstColor.hintText, fontSize: Sizes.s14),
        labelStyle: getMediumStyle(color: ConstColor.black),
        alignLabelWithHint: true,
        errorStyle: getRegularStyle(color: ConstColor.red, fontSize: Sizes.s12),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        fillColor: ConstColor.white,
        isDense: true,
        errorMaxLines: 3,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ConstColor.greyE6EA),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.s4)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ConstColor.greyE6EA),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.s4)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ConstColor.greyE6EA),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.s4)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ConstColor.red, width: Sizes.s0_5),
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.s4),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ConstColor.red10, width: Sizes.s0_5),
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.s4),
          ),
        ),
      ));
}
