import 'package:asroo_ecommerce/core/services/network/api_result.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/data_source/category_data_source.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/models/categories/categories_model/categories_model.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/models/create_category/create_category_model.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/models/create_category/create_category_response_model/create_category_response_model.dart';

class CategoryRepo {
  final CategoryDataSource categoryDataSource;

  CategoryRepo({required this.categoryDataSource});

  Future<ApiResult<CategoriesModel>> getCategories() async {
    try {
      final response = await categoryDataSource.getCategories();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure("Something went wrong");
    }
  }

  Future<ApiResult<CreateCategoryResponseModel>> createCategory(
      {required CreateCategoryModel createCategoryModel}) async {
    try {
      final response = await categoryDataSource.createCategory(
          createCategoryModel: createCategoryModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure("Something went wrong");
    }
  }
}
