import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyLoadingShimmer extends StatelessWidget {
  const MyLoadingShimmer({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade600,
        highlightColor: Colors.grey.shade400,
        child: widget);
  }
}
