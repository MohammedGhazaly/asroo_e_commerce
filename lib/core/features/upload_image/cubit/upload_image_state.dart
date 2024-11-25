part of 'upload_image_cubit.dart';

abstract class UploadImageState {}

class UploadImageStateInitial extends UploadImageState {}

class UploadImageLoading extends UploadImageState {}

class UploadImageFailure extends UploadImageState {}

class UploadImageSuccess extends UploadImageState {}
