import 'package:asroo_ecommerce/core/common/cubits/connectivity_cubit/connectivity_cubit.dart';
import 'package:asroo_ecommerce/core/common/screens/no_internet_screen.dart';
import 'package:asroo_ecommerce/core/routes/app_routes.dart';
import 'package:asroo_ecommerce/core/utils/theme/app_themes.dart';
import 'package:asroo_ecommerce/screen_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AsrooApp extends StatelessWidget {
  const AsrooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Asroo App',
        theme: AppTheme.getDarkTheme(),

        // home: ScreenOne(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: AppRoutes.test1,
      ),
    );
  }
}
