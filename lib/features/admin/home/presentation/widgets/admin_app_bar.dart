import 'package:asroo_ecommerce/asroo_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdminAppBar(
      {super.key,
      required this.isMain,
      required this.backgroundColor,
      required this.title});
  final bool isMain;
  final Color backgroundColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isMain
          ? GestureDetector(
              onTap: () {
                ZoomDrawer.of(context)!.toggle();
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size(1.sw, 50.h);
}
