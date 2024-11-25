import 'package:asroo_ecommerce/core/utils/colors/colors_dark.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/widgets/categories_body.dart';
import 'package:asroo_ecommerce/features/admin/home/presentation/widgets/admin_app_bar.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: AdminAppBar(
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
        title: "Categories",
      ),
      body: CategoriesBody(),
    );
  }
}
