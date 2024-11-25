import 'package:asroo_ecommerce/core/services/network/api_result.dart';
import 'package:asroo_ecommerce/features/admin/users/data/model/useres/useres_model/useres_model.dart';
import 'package:asroo_ecommerce/features/admin/users/data/data_source/useres_data_source.dart';

class UseresRepo {
  final UseresDataSource useresDataSource;

  UseresRepo({required this.useresDataSource});

  Future<ApiResult<UseresModel>> getUsers() async {
    try {
      final response = await useresDataSource.getUsers();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure("Something went wrong");
    }
  }
}
