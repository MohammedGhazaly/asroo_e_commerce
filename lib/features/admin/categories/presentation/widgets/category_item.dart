import 'package:asroo_ecommerce/asroo_app.dart';
import 'package:asroo_ecommerce/core/common/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:asroo_ecommerce/core/common/widgets/custom_container_linear_admin.dart';
import 'package:asroo_ecommerce/core/di/injection_container.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/models/categories/categories_model/category.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/repo/category_repo.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/cubit/category_cubit.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/widgets/update_categories_bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryItem extends StatelessWidget {
  final CategoryData categoryData;
  const CategoryItem({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 150.h,
      width: 1.sw,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  categoryData.name ?? "Category name",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Skeleton.shade(
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 26.sp,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        CustomBottomSheet.showModalBottomSheetContainer(
                          whenComplete: () {
                            print("FINISHED");
                          },
                          context: context,
                          widget: BlocProvider.value(
                            value: BlocProvider.of<CategoryCubit>(context),
                            child: UpdateCategoriesBottomSheet(),
                          ),
                        );
                      },
                      child: Skeleton.shade(
                        child: Icon(
                          Icons.edit,
                          color: Colors.green,
                          size: 26.sp,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: categoryData.image ?? "",
                  fit: BoxFit.cover,
                  errorWidget: (context, value, obj) {
                    return Image.asset("assets/images/admin/no image.jpg");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
