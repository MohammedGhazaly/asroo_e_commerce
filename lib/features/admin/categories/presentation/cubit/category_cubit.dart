import 'package:asroo_ecommerce/features/admin/categories/data/models/categories/categories_model/categories_model.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/models/categories/categories_model/category.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/repo/category_repo.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/cubit/category_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo) : super(CategoryStateInitial());

  final CategoryRepo categoryRepo;

  List<CategoryData> categories = [];
  late TextEditingController textEditingController;
  Future<void> getCategories() async {
    categories = [];
    emit(CategoryLoadingState());

    final either = await categoryRepo.getCategories();
    either.when(
      success: (model) {
        categories = model.data?.categories ?? [];
        emit(CategorySuccessState());
      },
      failure: (error) {
        emit(CategoryFailureState());
      },
    );
  }
}
