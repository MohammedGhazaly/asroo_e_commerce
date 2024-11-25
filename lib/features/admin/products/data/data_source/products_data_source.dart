import 'package:asroo_ecommerce/core/services/network/api_service.dart';
import 'package:asroo_ecommerce/core/services/network/graph_queries/admin/dashboard/dashboard_queries.dart';
import 'package:asroo_ecommerce/features/admin/products/data/models/products/products_model/products_model.dart';

class ProductsDataSource {
  final ApiService apiService;
  ProductsDataSource({required this.apiService});
  Future<ProductsModel> getProducts() async {
    return apiService
        .getAllProdcuts(DashboardQueries.instance.productsMapQuery());
  }
}
