import 'package:asroo_ecommerce/core/services/network/api_service.dart';
import 'package:asroo_ecommerce/core/services/network/graph_queries/admin/category/category_queries.dart';
import 'package:asroo_ecommerce/core/services/network/graph_queries/admin/dashboard/dashboard_queries.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/models/categories/categories_model/categories_model.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/models/create_category/create_category_model.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/models/create_category/create_category_response_model/create_category_response_model.dart';

class CategoryDataSource {
  final ApiService apiService;
  CategoryDataSource({required this.apiService});

  Future<CategoriesModel> getCategories() async {
    return apiService
        .getAllCategories(CategoryQueries.instance.getCategoriesMapQuery());
  }

  Future<CreateCategoryResponseModel> createCategory(
      {required CreateCategoryModel createCategoryModel}) async {
    return apiService.createCategory(CategoryQueries.instance
        .createCategoryMapQuery(categoryBody: createCategoryModel));
  }
}
