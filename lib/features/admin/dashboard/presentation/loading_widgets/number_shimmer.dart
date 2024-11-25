import 'package:asroo_ecommerce/core/loading/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberShimmer extends StatelessWidget {
  const NumberShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingShimmer(
      width: 30.w,
      height: 30.w,
      borderRadius: 8.r,
    );
  }
}
