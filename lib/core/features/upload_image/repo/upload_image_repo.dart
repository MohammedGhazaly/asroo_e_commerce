import 'dart:io';

import 'package:asroo_ecommerce/core/features/upload_image/data_source/upload_image_data_source.dart';
import 'package:asroo_ecommerce/core/features/upload_image/model/upload_image_model.dart';
import 'package:asroo_ecommerce/core/services/network/api_result.dart';

class UploadImageRepo {
  final UploadImageDataSource uploadImageDataSource;

  UploadImageRepo({required this.uploadImageDataSource});
  Future<ApiResult<UploadImageModel>> uploadImage(File file) async {
    try {
      final response = await uploadImageDataSource.uploadImage(image: file);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
