import 'package:asroo_ecommerce/core/common/widgets/custom_button.dart';
import 'package:asroo_ecommerce/core/common/widgets/custom_text_field.dart';
import 'package:asroo_ecommerce/core/utils/colors/colors_dark.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/cubit/category_cubit.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/cubit/category_state.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/widgets/category_upload_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateCategoriesBottomSheet extends StatefulWidget {
  const UpdateCategoriesBottomSheet({super.key});

  @override
  State<UpdateCategoriesBottomSheet> createState() =>
      _UpdateCategoriesBottomSheetState();
}

class _UpdateCategoriesBottomSheetState
    extends State<UpdateCategoriesBottomSheet> {
  late CategoryCubit categoryCubit;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    categoryCubit = context.read<CategoryCubit>()
      ..textEditingController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  "Update category",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add photo",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: "Remove",
                    width: 120.w,
                    height: 35.h,
                    lastRadius: 10.r,
                    threeRadius: 10.r,
                    backgroundColor: Colors.red,
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              CategoryUploadImage(),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Update category name",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                controller: categoryCubit.textEditingController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Category name cannot be empty";
                  } else if (value.length < 2) {
                    return "Category name must be at least 2 chars";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                backgroundColor: ColorsDark.white,
                lastRadius: 20.r,
                threeRadius: 20.r,
                textColor: ColorsDark.blueDark,
                onPressed: () {},
                text: "Update new category",
                width: 1.sw,
                height: 50.h,
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        );
      },
    );
  }
}
