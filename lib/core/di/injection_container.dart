import 'package:asroo_ecommerce/core/app_cubits/theme_cubit/theme_cubit.dart';
import 'package:asroo_ecommerce/core/features/upload_image/cubit/upload_image_cubit.dart';
import 'package:asroo_ecommerce/core/features/upload_image/data_source/upload_image_data_source.dart';
import 'package:asroo_ecommerce/core/features/upload_image/repo/upload_image_repo.dart';
import 'package:asroo_ecommerce/core/services/network/api_service.dart';
import 'package:asroo_ecommerce/core/services/network/dio_factory.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/data_source/category_data_source.dart';
import 'package:asroo_ecommerce/features/admin/categories/data/repo/category_repo.dart';
import 'package:asroo_ecommerce/features/admin/categories/presentation/cubit/category_cubit.dart';
import 'package:asroo_ecommerce/features/admin/products/data/data_source/products_data_source.dart';
import 'package:asroo_ecommerce/features/admin/products/data/repo/products_repo.dart';
import 'package:asroo_ecommerce/features/admin/products/presentation/cubit/products_cubit.dart';
import 'package:asroo_ecommerce/features/admin/users/data/data_source/useres_data_source.dart';
import 'package:asroo_ecommerce/features/admin/users/data/repo/useres_repo.dart';
import 'package:asroo_ecommerce/features/admin/users/presentation/cubit/useres_cubit.dart';
import 'package:asroo_ecommerce/features/auth/data/data_source/auth_data_source.dart';
import 'package:asroo_ecommerce/features/auth/data/repos/auth_repo.dart';
import 'package:asroo_ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setUpInjection() async {
  final dio = DioFactory.getDio();
  // Singelton لو مره واحده
  final navigatorKey = GlobalKey<NavigatorState>();
  sl.registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);
  sl.registerLazySingleton<ApiService>(() {
    return ApiService(dio);
  });

  // علشان بيستدعي أكثر من مره
  sl.registerFactory(() {
    return ThemeCubit();
  });
  initAuth();
  initUploadImage();
  injectCategory();
  injectProduct();
  injectUseres();
}

void initAuth() {
  sl.registerLazySingleton<AuthDataSource>(() {
    return AuthDataSource(apiService: sl());
  });
  sl.registerLazySingleton<AuthRepo>(() {
    return AuthRepo(authDataSource: sl());
  });

  sl.registerFactory<AuthCubit>(() {
    return AuthCubit(sl());
  });
}

void initUploadImage() {
  sl.registerLazySingleton<UploadImageDataSource>(() {
    return UploadImageDataSource(apiService: sl<ApiService>());
  });
  sl.registerLazySingleton<UploadImageRepo>(() {
    return UploadImageRepo(uploadImageDataSource: sl<UploadImageDataSource>());
  });

  sl.registerFactory<UploadImageCubit>(() {
    return UploadImageCubit(sl<UploadImageRepo>());
  });
}

void injectCategory() {
  sl.registerLazySingleton<CategoryDataSource>(() {
    return CategoryDataSource(apiService: sl<ApiService>());
  });
  sl.registerLazySingleton<CategoryRepo>(() {
    return CategoryRepo(categoryDataSource: sl<CategoryDataSource>());
  });

  sl.registerFactory<CategoryCubit>(() {
    return CategoryCubit(sl<CategoryRepo>());
  });
}

void injectProduct() {
  sl.registerLazySingleton<ProductsDataSource>(() {
    return ProductsDataSource(apiService: sl<ApiService>());
  });
  sl.registerLazySingleton<ProductsRepo>(() {
    return ProductsRepo(productsDataSource: sl<ProductsDataSource>());
  });

  sl.registerFactory<ProductsCubit>(() {
    return ProductsCubit(sl<ProductsRepo>());
  });
}

void injectUseres() {
  sl.registerLazySingleton<UseresDataSource>(() {
    return UseresDataSource(apiService: sl<ApiService>());
  });
  sl.registerLazySingleton<UseresRepo>(() {
    return UseresRepo(useresDataSource: sl<UseresDataSource>());
  });

  sl.registerFactory<UseresCubit>(() {
    return UseresCubit(sl<UseresRepo>());
  });
}
