import 'package:asroo_ecommerce/asroo_app.dart';
import 'package:asroo_ecommerce/core/services/network/api_result.dart';
import 'package:asroo_ecommerce/features/auth/data/data_source/auth_data_source.dart';
import 'package:asroo_ecommerce/features/auth/data/models/login_model/login_model.dart';
import 'package:asroo_ecommerce/features/auth/data/models/login_model/login_request_body.dart';
import 'package:asroo_ecommerce/features/auth/data/models/profile_model.dart';
import 'package:asroo_ecommerce/features/auth/data/models/signup_model/signup_model.dart';
import 'package:asroo_ecommerce/features/auth/data/models/signup_request_body/signup_request_body.dart';
import 'package:easy_localization/easy_localization.dart';

class AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepo({required this.authDataSource});

  Future<ApiResult<LoginModel>> login(
      {required LoginRequestBody loginBody}) async {
    try {
      final result = await authDataSource.login(requestBody: loginBody);
      if (result.data == null) {
        return ApiResult.failure("UNAUTHORIZED".tr());
      }

      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure("Something went wrong");
    }
  }

  Future<ApiResult<ProfileModel>> getProfileD(String token) async {
    try {
      final result = await authDataSource.getProfileModel(token);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure("Something went wrong");
    }
  }

  Future<ApiResult<SignupModel>> signUp(
      {required SignupReqeustBody signUpBody}) async {
    try {
      final result = await authDataSource.signUp(requestBody: signUpBody);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure("Something went wrong");
    }
  }
}
