import 'package:asroo_ecommerce/core/utils/colors/colors_dark.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet {
  const CustomBottomSheet._();

  static void showModalBottomSheetContainer({
    required BuildContext context,
    required Widget widget,
    Color? backgroundColor,
    VoidCallback? whenComplete,
  }) =>
      showModalBottomSheet<dynamic>(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        context: context,
        backgroundColor: backgroundColor ?? ColorsDark.blueDark,
        isScrollControlled: true,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                child: widget,
              ),
            ),
          );
        },
      ).whenComplete(whenComplete ?? () {});
}
