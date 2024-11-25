import 'package:asroo_ecommerce/core/utils/admin_drawer/admin_drawer_list.dart';
import 'package:asroo_ecommerce/core/utils/colors/colors_dark.dart';
import 'package:asroo_ecommerce/features/admin/home/presentation/widgets/admin_app_bar.dart';
import 'package:flutter/material.dart';

class MenuAdminScreen extends StatelessWidget {
  const MenuAdminScreen({super.key, required this.onPageChanged});
  final void Function(Widget widget, int id) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.blueDark,
      appBar: AdminAppBar(
        backgroundColor: ColorsDark.blueDark,
        isMain: false,
        title: "Asroo Store",
      ),
      body: Column(
        children: adminDrawerList.map<Widget>((value) {
          return ListTile(
            onTap: () {
              onPageChanged(value.page, value.id);
            },
            title: value.title,
            leading: value.icon,
          );
        }).toList(),
      ),
    );
  }
}
