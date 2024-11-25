import 'package:asroo_ecommerce/core/services/network/api_service.dart';
import 'package:asroo_ecommerce/core/services/network/graph_queries/auth/auth_queries.dart';
import 'package:asroo_ecommerce/core/services/shared_pref/pref_keys.dart';
import 'package:asroo_ecommerce/core/services/shared_pref/shared_pref_service.dart';
import 'package:asroo_ecommerce/features/auth/data/models/login_model/login_model.dart';
import 'package:asroo_ecommerce/features/auth/data/models/login_model/login_request_body.dart';
import 'package:asroo_ecommerce/features/auth/data/models/profile_model.dart';
import 'package:asroo_ecommerce/features/auth/data/models/signup_model/signup_model.dart';
import 'package:asroo_ecommerce/features/auth/data/models/signup_request_body/signup_request_body.dart';
import 'package:dio/dio.dart';

class AuthDataSource {
  AuthDataSource({required this.apiService});
  final ApiService apiService;

  Future<LoginModel> login({required LoginRequestBody requestBody}) async {
    return apiService.login(AuthQueries.loginMapQuery(loginBody: requestBody));
  }

  Future<ProfileModel> getProfileModel(String token) async {
    Dio dio = Dio();
    dio.options.headers["Authorization"] = 'Bearer $token';
    final client = ApiService(dio);
    final response = await client.userRole();
    return response;
  }

  Future<SignupModel> signUp({required SignupReqeustBody requestBody}) async {
    return apiService
        .signUp(AuthQueries.registerMapQuery(registerBody: requestBody));
  }
}
