import 'package:asroo_ecommerce/core/utils/theme/assets_extension.dart';
import 'package:asroo_ecommerce/core/utils/theme/color_extension.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  MyColors get color {
    return Theme.of(this).extension<MyColors>()!;
  }

  MyAssets get asset {
    return Theme.of(this).extension<MyAssets>()!;
  }

  TextStyle get textStyle {
    return Theme.of(this).textTheme.displaySmall!;
  }
  // asset
  // context.asset.bgImage

  // برضه دا اكستينشين بنستعمله
  // context.color.mainColor

  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplace(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushFinish(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) {
      return false;
    }, arguments: arguments);
  }

  void pop() {
    return Navigator.of(this).pop();
  }

  // كده دا بيتيح ليا الاتاي
  // context.pushName(اسم الراوت);
}
