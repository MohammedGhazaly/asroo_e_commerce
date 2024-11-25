import 'package:asroo_ecommerce/core/common/widgets/custom_container_linear_admin.dart';
import 'package:asroo_ecommerce/core/loading/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryLoading extends StatelessWidget {
  const CategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 10.h,
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LoadingShimmer(
                  width: 90.w,
                  height: 20.h,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    LoadingShimmer(
                      width: 50.w,
                      height: 50.h,
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    LoadingShimmer(
                      width: 50.w,
                      height: 50.h,
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            LoadingShimmer(
              width: 150.w,
              height: 150.w,
            ),
          ],
        ),
      ),
      height: 150.h,
      width: 1.sw,
    );
  }
}
