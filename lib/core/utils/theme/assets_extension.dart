import 'package:flutter/material.dart';

class MyAssets extends ThemeExtension<MyAssets> {
  final String? bgImage;

  const MyAssets({required this.bgImage});
  @override
  ThemeExtension<MyAssets> copyWith({String? bgImage}) {
    return MyAssets(bgImage: bgImage);
    // TODO: implement copyWith
    // throw UnimplementedError();
  }

  @override
  ThemeExtension<MyAssets> lerp(
      covariant ThemeExtension<MyAssets>? other, double t) {
    if (other is! MyAssets) {
      return this;
    }
    return MyAssets(bgImage: bgImage);

    // TODO: implement lerp
    // throw UnimplementedError();
  }

  static const MyAssets dark = MyAssets(
    bgImage: "",
  );
  static const MyAssets light = MyAssets(
    bgImage: "",
  );
}
