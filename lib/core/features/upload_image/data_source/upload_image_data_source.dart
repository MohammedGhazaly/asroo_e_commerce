import 'dart:io';

import 'package:asroo_ecommerce/core/features/upload_image/model/upload_image_model.dart';
import 'package:asroo_ecommerce/core/services/network/api_service.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

class UploadImageDataSource {
  UploadImageDataSource({required this.apiService});
  final ApiService apiService;

  Future<UploadImageModel> uploadImage({required File image}) async {
    return await apiService.uploadImage(
      FormData.fromMap(
        {
          "file": MultipartFile.fromFileSync(image.path),
        },
      ),
    );
  }
}
