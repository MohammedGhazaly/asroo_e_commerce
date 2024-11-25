import 'dart:developer';
import 'dart:io';

import 'package:asroo_ecommerce/core/features/upload_image/repo/upload_image_repo.dart';
import 'package:bloc/bloc.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this.uploadImageRepo) : super(UploadImageStateInitial());
  final UploadImageRepo uploadImageRepo;
  // String? fileLocation;
  String? imageLocation;
  Future<String?> uploadImage({required File file}) async {
    emit(UploadImageLoading());
    final result = await uploadImageRepo.uploadImage(file);
    return result.when(
      success: (model) {
        emit(UploadImageSuccess());
        imageLocation = model.location!;
        return model.location!;
      },
      failure: (error) {
        emit(UploadImageFailure());
      },
    );
  }
}
