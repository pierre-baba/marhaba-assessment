import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocaleEdgeInsets extends EdgeInsets {
  LocaleEdgeInsets.only(
      {double start = 0, double end = 0, double top = 0, double bottom = 0})
      : super.only(
            left: (Get.locale?.languageCode == 'en') ? start : end,
            right: (Get.locale?.languageCode == 'en') ? end : start,
            top: top,
            bottom: bottom);
}

class LocaleBorderRadius extends BorderRadius {
  LocaleBorderRadius.only(
      {Radius topStart = Radius.zero,
      Radius topEnd = Radius.zero,
      Radius bottomStart = Radius.zero,
      Radius bottomEnd = Radius.zero})
      : super.only(
          topLeft: (Get.locale?.languageCode == 'en') ? topStart : topEnd,
          topRight: (Get.locale?.languageCode == 'en') ? topEnd : topStart,
          bottomLeft:
              (Get.locale?.languageCode == 'en') ? bottomStart : bottomEnd,
          bottomRight:
              (Get.locale?.languageCode == 'en') ? bottomEnd : bottomStart,
        );
}

class LocaleBorder extends Border {
  LocaleBorder.only(
      {BorderSide start = BorderSide.none,
      BorderSide end = BorderSide.none,
      BorderSide top = BorderSide.none,
      BorderSide bottom = BorderSide.none})
      : super(
            left: (Get.locale?.languageCode == 'en') ? start : end,
            right: (Get.locale?.languageCode == 'en') ? end : start,
            top: top,
            bottom: bottom);
}

class LocaleAlignmentGeometry {
  static AlignmentGeometry get centerStart => Get.locale?.languageCode == 'en'
      ? Alignment.centerLeft
      : Alignment.centerRight;

  static AlignmentGeometry get centerEnd => Get.locale?.languageCode == 'en'
      ? Alignment.centerRight
      : Alignment.centerLeft;

  static AlignmentGeometry get topStart =>
      Get.locale?.languageCode == 'en' ? Alignment.topLeft : Alignment.topRight;

  static AlignmentGeometry get topEnd =>
      Get.locale?.languageCode == 'en' ? Alignment.topRight : Alignment.topLeft;

  static AlignmentGeometry get bottomStart => Get.locale?.languageCode == 'en'
      ? Alignment.bottomLeft
      : Alignment.bottomRight;

  static AlignmentGeometry get bottomEnd => Get.locale?.languageCode == 'en'
      ? Alignment.bottomRight
      : Alignment.bottomLeft;
}
