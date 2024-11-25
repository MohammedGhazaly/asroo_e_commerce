import 'package:asroo_ecommerce/features/admin/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:asroo_ecommerce/features/admin/home/presentation/cubit/admin_home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  AdminHomeCubit() : super(AdminHomeInitial());
  Widget currentPage = DashBoardScreen();

  void pageChanged() {
    emit(PageChanged());
  }
}
