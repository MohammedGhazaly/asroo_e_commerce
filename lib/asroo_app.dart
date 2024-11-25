import 'package:asroo_ecommerce/core/app_cubits/theme_cubit/theme_cubit.dart';
import 'package:asroo_ecommerce/core/common/cubits/connectivity_cubit/connectivity_cubit.dart';
import 'package:asroo_ecommerce/core/common/screens/no_internet_screen.dart';
import 'package:asroo_ecommerce/core/di/injection_container.dart';
import 'package:asroo_ecommerce/core/routes/app_routes.dart';
import 'package:asroo_ecommerce/core/services/shared_pref/pref_keys.dart';
import 'package:asroo_ecommerce/core/services/shared_pref/shared_pref_service.dart';
import 'package:asroo_ecommerce/core/utils/theme/app_themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AsrooApp extends StatelessWidget {
  const AsrooApp({super.key});

  @override
  Widget build(BuildContext context) {
    final token = SharedPrefService.instance.getString(PrefKeys.accessToken);
    final userRole = SharedPrefService.instance.getString(PrefKeys.role);
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    // final themeCubit = context.read<ThemeCubit>();
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: Size(390, 844),
          minTextAdapt: true,
          child: MaterialApp(
            navigatorKey: sl<GlobalKey<NavigatorState>>(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Asroo App',
            theme: themeCubit.isDark
                ? AppTheme.getDarkTheme()
                : AppTheme.getLightTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            // initialRoute: SharedPrefService.instance
            //             .getString(PrefKeys.accessToken) ==
            //         null
            //     ? AppRoutes.loginRoute
            //     : SharedPrefService.instance.getString(PrefKeys.role) == "admin"
            //         ? AppRoutes.admingHomeScreenRoute
            //         : AppRoutes.customerHomeScreenRoute,
            initialRoute: (token == null)
                ? AppRoutes.loginRoute
                : userRole == "customer"
                    ? AppRoutes.customerHomeScreenRoute
                    // ? AppRoutes.admingHomeScreenRoute
                    : AppRoutes.admingHomeScreenRoute,
          ),
        );
      },
    );
  }
}
