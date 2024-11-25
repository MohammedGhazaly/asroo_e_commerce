import 'package:asroo_ecommerce/core/app_cubits/theme_cubit/theme_cubit.dart';
import 'package:asroo_ecommerce/core/common/animations/animations_do.dart';
import 'package:asroo_ecommerce/core/common/widgets/custom_linear_button.dart';
import 'package:asroo_ecommerce/core/extensions/context_extensions.dart';
import 'package:asroo_ecommerce/core/services/shared_pref/pref_keys.dart';
import 'package:asroo_ecommerce/core/services/shared_pref/shared_pref_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeAndLangButtons extends StatelessWidget {
  const ThemeAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomFadeInRight(
          duration: 400,
          child: CustomLinearButton(
            height: 50.h,
            width: 50.h,
            onPressed: () {
              themeCubit.changeAppTheme();
            },
            child: Icon(
              themeCubit.isDark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
              color: Colors.white,
            ),
          ),
        ),
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            height: 50.h,
            width: 80.w,
            onPressed: () {
              final lang =
                  SharedPrefService.instance.getString(PrefKeys.language);
              if (lang == null || lang == "ar") {
                context.setLocale(Locale("en"));
                SharedPrefService.instance.setString(PrefKeys.language, "en");
              } else {
                context.setLocale(Locale("ar"));
                SharedPrefService.instance.setString(PrefKeys.language, "ar");
              }
              themeCubit.languageChanged();
            },
            child: Text(
              "language".tr(),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                // color: context.color.textColor,
                color: Colors.white,
                fontFamily: "Cairo",
              ),
            ),
          ),
        )
      ],
    );
  }
}
