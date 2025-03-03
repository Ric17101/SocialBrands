import 'package:flutter/material.dart';

class AssetImages {
  AssetImages._();

  static Image getAssetIcon(String fileName) {
    return Image.asset('assets/images/$fileName.png');
  }

  static Image apple = getAssetIcon('apple');
  static Image facebook = getAssetIcon('facebook');
  static Image samsung = getAssetIcon('samsung');
  static Image spotify = getAssetIcon('spotify');
  static Image others = getAssetIcon('others');
  static Image windows = getAssetIcon('windows');
  static Image youtube = getAssetIcon('youtube');
}
