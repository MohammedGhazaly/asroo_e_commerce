import 'package:asroo_ecommerce/core/utils/colors/colors_dark.dart';
import 'package:asroo_ecommerce/features/admin/home/presentation/widgets/admin_app_bar.dart';
import 'package:flutter/material.dart';

class UseresScreen extends StatelessWidget {
  const UseresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
        title: "Users",
      ),
    );
  }
}
