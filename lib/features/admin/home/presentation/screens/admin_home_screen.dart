import 'package:asroo_ecommerce/asroo_app.dart';
import 'package:asroo_ecommerce/core/common/widgets/custom_dialogs.dart';
import 'package:asroo_ecommerce/core/routes/app_routes.dart';
import 'package:asroo_ecommerce/core/services/shared_pref/pref_keys.dart';
import 'package:asroo_ecommerce/core/services/shared_pref/shared_pref_service.dart';
import 'package:asroo_ecommerce/core/utils/colors/colors_dark.dart';
import 'package:asroo_ecommerce/features/admin/home/presentation/cubit/admin_home_cubit.dart';
import 'package:asroo_ecommerce/features/admin/home/presentation/cubit/admin_home_state.dart';
import 'package:asroo_ecommerce/features/admin/home/presentation/widgets/menu_admin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final adminHomeCubit = context.read<AdminHomeCubit>();
    return BlocBuilder<AdminHomeCubit, AdminHomeState>(
      builder: (context, state) {
        return ZoomDrawer(
          mainScreen: adminHomeCubit.currentPage,
          borderRadius: 24.r,
          showShadow: true,
          menuBackgroundColor: ColorsDark.blueDark,
          drawerShadowsBackgroundColor: ColorsDark.mainColor.withOpacity(0.6),
          menuScreen: Builder(
            builder: (context) {
              return MenuAdminScreen(
                onPageChanged: (page, id) {
                  if (id == 5) {
                    CustomDialog.twoButtonDialog(
                      context: context,
                      textBody: "log_out_confirm".tr(),
                      textButton1: "yes".tr(),
                      textButton2: "no".tr(),
                      onPressed: () async {
                        ZoomDrawer.of(context)!.close();

                        await SharedPrefService.instance
                            .removePreference(PrefKeys.accessToken);
                        await SharedPrefService.instance
                            .removePreference(PrefKeys.userId);
                        await SharedPrefService.instance
                            .removePreference(PrefKeys.role)
                            .then((value) {
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.loginRoute, (route) {
                            return false;
                          });
                        });

                        // SharedPrefService.instance.removePreference(PrefKeys);
                      },
                      isLoading: false,
                    );
                  } else {
                    adminHomeCubit.currentPage = page;
                    adminHomeCubit.pageChanged();
                    ZoomDrawer.of(context)!.close();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
