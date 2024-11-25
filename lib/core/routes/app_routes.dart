import 'package:asroo_ecommerce/core/di/injection_container.dart';
import 'package:asroo_ecommerce/core/routes/base_route.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/cubit/category_cubit.dart';
import 'package:asroo_ecommerce/features/admin/home/presentation/cubit/admin_home_cubit.dart';
import 'package:asroo_ecommerce/features/admin/home/presentation/screens/admin_home_screen.dart';
import 'package:asroo_ecommerce/features/admin/products/presentation/cubit/products_cubit.dart';
import 'package:asroo_ecommerce/features/admin/users/presentation/cubit/useres_cubit.dart';
import 'package:asroo_ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:asroo_ecommerce/features/auth/presentation/screens/login_screen.dart';
import 'package:asroo_ecommerce/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:asroo_ecommerce/features/customer/home/presentation/screens/customer_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String loginRoute = "login-view";
  static const String signUpRoute = "sigup-view";
  static const String customerHomeScreenRoute = "customer-home-route";
  static const String admingHomeScreenRoute = "admin-home-route";

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case loginRoute:
        return BaseRoute(
          // builder: (context) => Test1Page(arguments: args),
          page: BlocProvider<AuthCubit>(
            create: (context) => sl<AuthCubit>(),
            child: LoginScreen(),
          ),
        );
      case signUpRoute:
        return BaseRoute(
          // builder: (context) => Test1Page(arguments: args),
          page: BlocProvider<AuthCubit>(
            create: (context) => sl<AuthCubit>(),
            child: SignUpScreen(),
          ),
        );
      case customerHomeScreenRoute:
        return BaseRoute(
          // builder: (context) => Test1Page(arguments: args),
          page: CustomerHomeScreen(),
        );
      case admingHomeScreenRoute:
        return BaseRoute(
            // builder: (context) => Test1Page(arguments: args),
            page: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AdminHomeCubit(),
            ),
            BlocProvider(
              create: (context) => sl<CategoryCubit>()..getCategories(),
            ),
            BlocProvider(
              create: (context) => sl<ProductsCubit>()..getProducts(),
            ),
            BlocProvider(
              create: (context) => sl<UseresCubit>()..getUseres(),
            ),
          ],
          child: AdminHomeScreen(),
        )

            // BlocProvider(
            //   create: (context) => AdminHomeCubit(),
            //   child: AdminHomeScreen(),
            // ),
            );
      default:
        return BaseRoute(
          page: Scaffold(),
        );
    }
  }
}
