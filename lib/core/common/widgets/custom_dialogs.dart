import 'package:asroo_ecommerce/core/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog {
  const CustomDialog._();

  static void twoButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton1,
    required String textButton2,
    required void Function() onPressed,
    required bool isLoading,
  }) {
    showDialog<dynamic>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 20.h,
          ),
          child: Center(
            child: Text(
              textBody,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
        actions: [
          CustomButton(
            backgroundColor: Colors.red,
            onPressed: onPressed,
            text: textButton1,
            width: 320.w,
            height: 45.h,
            isLoading: isLoading,
            lastRadius: 10,
            threeRadius: 10,
          ),
          SizedBox(height: 10.h, width: 1.w),
          CustomButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: textButton2,
            width: 320.w,
            height: 45.h,
            lastRadius: 10,
            threeRadius: 10,
          ),
        ],
      ),
    );
  }
}