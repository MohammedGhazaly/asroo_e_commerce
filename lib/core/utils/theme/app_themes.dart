import 'package:asroo_ecommerce/core/utils/colors/colors_dark.dart';
import 'package:asroo_ecommerce/core/utils/colors/colors_light.dart';
import 'package:asroo_ecommerce/core/utils/theme/assets_extension.dart';
import 'package:asroo_ecommerce/core/utils/theme/color_extension.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getDarkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsDark.mainColor,
      extensions: <ThemeExtension<dynamic>>[MyColors.dark, MyAssets.dark],
      useMaterial3: true,
    );
  }

  static ThemeData getLightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsLight.mainColor,
      extensions: <ThemeExtension<dynamic>>[MyColors.light, MyAssets.light],
      useMaterial3: true,
    );
  }
}
