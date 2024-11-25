import 'package:asroo_ecommerce/core/services/network/api_result.dart';
import 'package:asroo_ecommerce/features/admin/products/data/models/products/products_model/products_model.dart';
import 'package:asroo_ecommerce/features/admin/products/data/data_source/products_data_source.dart';

class ProductsRepo {
  final ProductsDataSource productsDataSource;

  ProductsRepo({required this.productsDataSource});
  Future<ApiResult<ProductsModel>> getProducts() async {
    try {
      final response = await productsDataSource.getProducts();

      return ApiResult.success(response);
    } catch (e) {
      print(e);
      return ApiResult.failure("Something went wrong");
    }
  }
}
