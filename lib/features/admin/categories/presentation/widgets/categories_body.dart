import 'package:asroo_ecommerce/core/common/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:asroo_ecommerce/core/common/widgets/custom_button.dart';
import 'package:asroo_ecommerce/core/di/injection_container.dart';
import 'package:asroo_ecommerce/core/utils/colors/colors_dark.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/models/categories/categories_model/category.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/repo/category_repo.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/cubit/category_cubit.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/cubit/category_state.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/widgets/category_item.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/widgets/create_categories_bottom_sheet.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/widgets/loading/category_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesBody extends StatefulWidget {
  const CategoriesBody({super.key});

  @override
  State<CategoriesBody> createState() => _CategoriesBodyState();
}

class _CategoriesBodyState extends State<CategoriesBody> {
  late CategoryCubit categoryCubit;

  // categoryCubit.textEditingController = TextEditingController();

  @override
  void initState() {
    categoryCubit = context.read<CategoryCubit>();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 30.h,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All categories",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  CustomButton(
                    onPressed: () {
                      CustomBottomSheet.showModalBottomSheetContainer(
                        whenComplete: () {},
                        context: context,
                        widget: BlocProvider.value(
                          value: BlocProvider.of<CategoryCubit>(context),
                          // create: (context) =>
                          //     CategoryCubit(sl<CategoryRepo>()),
                          child: CreateCategoriesBottomSheet(
                            onSaved: () {
                              // categoryCubit.getCategories();
                              // Navigator.of(context).pop();
                            },
                          ),
                        ),
                      );
                    },
                    backgroundColor: ColorsDark.blueDark,
                    text: "Add",
                    width: 90.w,
                    height: 35.h,
                    lastRadius: 10.r,
                    threeRadius: 10.r,
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              (state is CategoryLoadingState)
                  ? Expanded(
                      child: Skeletonizer(
                        // effect: PulseEffect(
                        //   from: Colors.grey.shade400,
                        //   to: Colors.grey.shade600,
                        // ),
                        effect: ShimmerEffect(
                          highlightColor: Colors.grey.shade400,
                          baseColor: Colors.grey.shade600,
                        ),
                        enabled: true,
                        // containersColor: Colors.red,

                        // ignoreContainers: true,
                        child: RefreshIndicator.adaptive(
                          onRefresh: () async {
                            print("HELLO");
                            categoryCubit.getCategories();
                          },
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemCount: 10,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 24.h,
                              );
                            },
                            itemBuilder: (context, index) {
                              return CategoryItem(
                                categoryData: CategoryData(
                                    image: "Image", name: "Category name"),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: RefreshIndicator.adaptive(
                        triggerMode: RefreshIndicatorTriggerMode.anywhere,
                        onRefresh: () async {
                          categoryCubit.getCategories();
                        },
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: categoryCubit.categories.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 24.h,
                            );
                          },
                          itemBuilder: (context, index) {
                            return CategoryItem(
                              categoryData: categoryCubit.categories[index],
                            );
                          },
                        ),
                      ),
                    )
              // CategoryItem()
            ],
          ),
        );
      },
    );
  }
}
