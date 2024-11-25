import 'package:asroo_ecommerce/asroo_app.dart';
import 'package:asroo_ecommerce/bloc_observer.dart';
import 'package:asroo_ecommerce/core/app_cubits/theme_cubit/theme_cubit.dart';
import 'package:asroo_ecommerce/core/common/cubits/connectivity_cubit/connectivity_cubit.dart';
import 'package:asroo_ecommerce/core/di/injection_container.dart';
import 'package:asroo_ecommerce/core/features/upload_image/cubit/upload_image_cubit.dart';
import 'package:asroo_ecommerce/core/services/shared_pref/pref_keys.dart';
import 'package:asroo_ecommerce/core/services/shared_pref/shared_pref_service.dart';
import 'package:asroo_ecommerce/features/admin/home/presentation/cubit/admin_home_cubit.dart';
import 'package:asroo_ecommerce/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await EasyLocalization.ensureInitialized();
  await SharedPrefService.instance.instantiatePreferences();
  await setUpInjection();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  // runApp(AsrooApp());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConnectivityCubit()..listenForConnectivity(),
        ),
        BlocProvider(
          create: (context) => AdminHomeCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => sl<ThemeCubit>()
            ..changeAppTheme(
              themeMode: SharedPrefService.instance.getBoolean(
                PrefKeys.temeMode,
              ),
            ),
        ),
        BlocProvider<UploadImageCubit>(
            create: (context) => sl<UploadImageCubit>()),
      ],
      child: EasyLocalization(
        startLocale: SharedPrefService.instance.getString(PrefKeys.language) ==
                null
            ? Locale("ar")
            : Locale(SharedPrefService.instance.getString(PrefKeys.language)!),
        path: "assets/translations",
        supportedLocales: [
          Locale("ar"),
          Locale("en"),
        ],
        child: AsrooApp(),
      ),
    ),
  );
}
