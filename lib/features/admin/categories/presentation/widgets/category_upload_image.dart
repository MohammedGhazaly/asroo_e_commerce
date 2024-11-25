import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryUploadImage extends StatelessWidget {
  const CategoryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16.r),
        // image: DecorationImage(
        //   fit: BoxFit.cover,
        //   image: NetworkImage(url),
        // ),
      ),
    );
  }
}
