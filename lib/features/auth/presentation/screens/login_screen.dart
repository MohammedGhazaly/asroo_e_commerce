import 'package:asroo_ecommerce/core/extensions/context_extensions.dart';
import 'package:asroo_ecommerce/features/auth/presentation/widgets/login/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/shared/bottom_custom_painter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomPaint(
        size: Size(1.sw, 50.h),
        painter: BottomTriangleShape(
          gradient: LinearGradient(
            colors: [
              context.color.bluePinkDark!,
              context.color.bluePinkDark!,
              context.color.bluePinkDark!,
              context.color.bluePinkLight!,
            ],
          ),
        ),
      ),
      body: LoginBody(),
    );
  }
}
