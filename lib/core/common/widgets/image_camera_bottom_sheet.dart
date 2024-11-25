import 'package:asroo_ecommerce/asroo_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ImageCameraBottomSheet extends StatelessWidget {
  final Function()? galleryCallBack;
  final Function()? cameraCallBack;
  const ImageCameraBottomSheet(
      {super.key, this.galleryCallBack, this.cameraCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Pick image'.tr()),
            onTap: galleryCallBack,
          ),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Capture image'.tr()),
            onTap: cameraCallBack,
          ),
        ],
      ),
    );
  }
}
