import 'package:asroo_ecommerce/asroo_app.dart';
import 'package:asroo_ecommerce/core/common/cubits/connectivity_cubit/connectivity_cubit.dart';
import 'package:asroo_ecommerce/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
        )
      ],
      child: EasyLocalization(
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
