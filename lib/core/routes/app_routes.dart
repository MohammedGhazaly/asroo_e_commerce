import 'package:asroo_ecommerce/core/routes/base_route.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String test1 = "test1";

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case test1:
        return BaseRoute(
          // builder: (context) => Test1Page(arguments: args),
          page: Scaffold(),
        );
      default:
        return BaseRoute(
          page: Scaffold(),
        );
    }
  }
}
