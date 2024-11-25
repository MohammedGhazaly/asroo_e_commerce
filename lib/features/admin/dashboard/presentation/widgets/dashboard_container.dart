import 'package:asroo_ecommerce/core/common/widgets/custom_container_linear_admin.dart';
import 'package:asroo_ecommerce/features/admin/dashboard/presentation/loading_widgets/number_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer(
      {super.key,
      required this.title,
      required this.number,
      required this.image,
      required this.isLoading});
  final String title;
  final String number;
  final String image;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: null,
      width: 1.sw,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  if (isLoading)
                    NumberShimmer()
                  else
                    Text(
                      number,
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                ],
              ),
            ),
            Image.asset(
              image,
              width: 64.w,
            )
          ],
        ),
      ),
    );
  }
}
