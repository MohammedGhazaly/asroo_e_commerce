import 'package:asroo_ecommerce/core/services/network/api_service.dart';
import 'package:asroo_ecommerce/core/services/network/graph_queries/admin/dashboard/dashboard_queries.dart';
import 'package:asroo_ecommerce/features/admin/users/data/model/useres/useres_model/useres_model.dart';

class UseresDataSource {
  final ApiService apiService;
  UseresDataSource({required this.apiService});

  Future<UseresModel> getUsers() async {
    return apiService.getAllUsers(DashboardQueries.instance.usersMapQuery());
  }
}
