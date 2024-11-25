import 'package:asroo_ecommerce/features/admin/categories/presentation/screens/category_screen.dart';
import 'package:asroo_ecommerce/features/admin/add_notifications/presentation/screens/add_notifications_screen.dart';
import 'package:asroo_ecommerce/features/admin/products/presentation/screens/products_screen.dart';
import 'package:asroo_ecommerce/features/admin/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:asroo_ecommerce/features/admin/users/presentation/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<DrawerItemModel> adminDrawerList = [
  // Dashobard
  DrawerItemModel(
    id: 0,
    icon: Icon(
      Icons.dashboard,
      color: Colors.white,
    ),
    title: Text(
      "Dashboard",
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
    ),
    page: DashBoardScreen(),
  ),
  // Categories
  DrawerItemModel(
    id: 1,
    icon: Icon(
      Icons.category,
      color: Colors.white,
    ),
    title: Text(
      "Categories",
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
    ),
    page: CategoriesScreen(),
  ),
  // Products

  DrawerItemModel(
    id: 2,
    icon: Icon(
      Icons.production_quantity_limits,
      color: Colors.white,
    ),
    title: Text(
      "Products",
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
    ),
    page: ProductsScreen(),
  ),
  // Users

  DrawerItemModel(
    id: 3,
    icon: Icon(
      Icons.notifications,
      color: Colors.white,
    ),
    title: Text(
      "Notifications",
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
    ),
    page: AddNotificationsScreen(),
  ),
  DrawerItemModel(
    id: 4,
    icon: Icon(
      Icons.person_4_rounded,
      color: Colors.white,
    ),
    title: Text(
      "Useres",
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
    ),
    page: UseresScreen(),
  ),
  DrawerItemModel(
    id: 5,
    icon: Icon(
      Icons.logout,
      color: Colors.white,
    ),
    title: Text(
      "Logout",
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
      ),
    ),
    page: DashBoardScreen(),
  ),
];

class DrawerItemModel {
  final Icon icon;
  final Widget title;
  final Widget page;
  final int id;

  DrawerItemModel({
    required this.icon,
    required this.title,
    required this.page,
    required this.id,
  });
}
