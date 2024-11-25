import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

class ImagePickerHelper {
  static Future<File> compressImage(File file) async {
    try {
      Uuid uuid = Uuid();
      String randomStrng = uuid.v4();

      Directory directory = await getTemporaryDirectory();

      String targetPath = directory.path + "/${randomStrng}.jpg";
      XFile? result = await FlutterImageCompress.compressAndGetFile(
          file.path, targetPath,
          quality: 80);
      return File(result!.path);
    } catch (e) {
      return file;
    }
  }

  Future<bool> galleryStatus() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    final androidInfo = await deviceInfoPlugin.androidInfo;
    if ((Platform.isIOS) ||
        (Platform.isAndroid && androidInfo.version.sdkInt >= 33)) {
      var status = await Permission.photos.status;
      if (status == PermissionStatus.granted ||
          status == PermissionStatus.limited) {
        return true;
      } else {
        status = await Permission.photos.request();
        if (status == PermissionStatus.granted ||
            status == PermissionStatus.limited) {
          return true;
        } else {
          return false;
        }
      }
    } else {
      var status = await Permission.storage.status;
      if (status == PermissionStatus.granted ||
          status == PermissionStatus.limited) {
        return true;
      } else {
        status = await Permission.storage.request();
        if (status == PermissionStatus.granted ||
            status == PermissionStatus.limited) {
          return true;
        } else {
          return false;
        }
      }
    }
  }

  Future<bool> cameraStatus() async {
    var status = await Permission.camera.status;
    if (status == PermissionStatus.granted ||
        status == PermissionStatus.limited) {
      return true;
    } else {
      status = await Permission.camera.request();
      if (status == PermissionStatus.granted ||
          status == PermissionStatus.limited) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<File?> checkAndPickImage({required ImageSource imageSource}) async {
    if (imageSource == ImageSource.gallery) {
      var status = await galleryStatus();
      if (status == true) {
        return pickImage(imageSource: imageSource);
      } else {
        return null;
      }
    } else {
      var status = await cameraStatus();
      if (status == true) {
        return pickImage(imageSource: imageSource);
      } else {
        return null;
      }
    }
  }

  Future<File?> pickImage({required ImageSource imageSource}) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        final imageTemporary = File(image.path);
        final compressedImage = compressImage(imageTemporary);
        return compressedImage;
      }
    } catch (e) {
      return null;
    }
  }
}
