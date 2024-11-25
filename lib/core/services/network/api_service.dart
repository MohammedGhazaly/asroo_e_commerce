import 'package:asroo_ecommerce/core/features/upload_image/model/upload_image_model.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/models/categories/categories_model/categories_model.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/models/create_category/create_category_response_model/create_category_response_model.dart';
import 'package:asroo_ecommerce/features/admin/products/data/models/products/products_model/products_model.dart';
import 'package:asroo_ecommerce/features/admin/users/data/model/useres/useres_model/useres_model.dart';
import 'package:asroo_ecommerce/features/auth/data/models/login_model/login_model.dart';
import 'package:asroo_ecommerce/features/auth/data/models/profile_model.dart';
import 'package:asroo_ecommerce/features/auth/data/models/signup_model/signup_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphql)
  Future<LoginModel> login(
    @Body() Map<String, dynamic> mutation,
  );
  @POST(graphql)
  Future<SignupModel> signUp(
    @Body() Map<String, dynamic> mutation,
  );
  @POST(graphql)
  Future<ProductsModel> getAllProdcuts(
    @Body() Map<String, dynamic> query,
  );
  @POST(graphql)
  Future<CategoriesModel> getAllCategories(
    @Body() Map<String, dynamic> query,
  );
  @POST(graphql)
  Future<CreateCategoryResponseModel> createCategory(
    @Body() Map<String, dynamic> mutation,
  );
  @POST(graphql)
  Future<UseresModel> getAllUsers(
    @Body() Map<String, dynamic> query,
  );

  @GET('/api/v1/auth/profile')
  Future<ProfileModel> userRole();

  @POST('/api/v1/files/upload')
  Future<UploadImageModel> uploadImage(
    @Body() FormData file,
  );
  @POST('/api/v1/files/upload')
  Future<UploadImageModel> getProducts(
    @Body() FormData file,
  );
}
