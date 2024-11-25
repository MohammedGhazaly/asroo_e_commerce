import 'package:asroo_ecommerce/core/utils/colors/colors_dark.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/cubit/category_cubit.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/cubit/category_state.dart';
import 'package:asroo_ecommerce/features/admin/dashboard/presentation/widgets/dashboard_container.dart';
import 'package:asroo_ecommerce/features/admin/home/presentation/widgets/admin_app_bar.dart';
import 'package:asroo_ecommerce/features/admin/products/presentation/cubit/products_cubit.dart';
import 'package:asroo_ecommerce/features/admin/products/presentation/cubit/products_state.dart';
import 'package:asroo_ecommerce/features/admin/users/presentation/cubit/useres_cubit.dart';
import 'package:asroo_ecommerce/features/admin/users/presentation/cubit/users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: AdminAppBar(
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
        title: "Dashboard",
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductsCubit>().getProducts();
          context.read<CategoryCubit>().getCategories();
          context.read<UseresCubit>().getUseres();
        },
        child: ListView(
          children: [
            SizedBox(
              height: 32.h,
            ),
            BlocBuilder<ProductsCubit, ProductState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: DashboardContainer(
                    image: "assets/images/admin/products_drawer.png",
                    isLoading: (state is GetProductLoadingState),
                    number: context
                        .read<ProductsCubit>()
                        .products
                        .length
                        .toString(),
                    title: "Products",
                  ),
                );
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: DashboardContainer(
                    image: "assets/images/admin/categories_drawer.png",
                    isLoading: (state is CategoryLoadingState),
                    number: context
                        .read<CategoryCubit>()
                        .categories
                        .length
                        .toString(),
                    title: "Categories",
                  ),
                );
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            BlocBuilder<UseresCubit, UseresState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: DashboardContainer(
                    image: "assets/images/admin/users_drawer.png",
                    isLoading: (state is GetUseresLoadingState),
                    number:
                        context.read<UseresCubit>().useres.length.toString(),
                    title: "Users",
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
