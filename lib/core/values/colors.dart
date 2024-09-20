import 'package:flutter/material.dart';

class AppColors {
//light
  static const Color lightBlack = Color(0xff222222);
  static const Color lightGrey = Color(0xff9B9B9B);
  static const Color lightPrimary = Color(0xffDB3022);
  static const Color lightBackground = Color(0xffF9F9F9);
  static const Color lightWhite = Color(0xffFFFFFF);
  static const Color lightError = Color(0xffF01F0E);
  static const Color lightSuccess = Color(0xff2AA952);
  static const Color lightSale = Color(0xffDB3022);

  //dark
  static const Color darkOrdinaryText = Color(0xffF5F5F5);
  static const Color darkGrey = Color(0xffABB4BD);
  static const Color darkPrimary = Color(0xff1E1F28);
  static const Color darkDark = Color(0xff2A2C36);
  static const Color darkBackground = Color(0xff1E1F28);
  static const Color darkWhite = Color(0xffF6F6F6);
  static const Color darkError = Color(0xffFF2424);
  static const Color darkSuccess = Color(0xff55D85A);
  static const Color darkSale = Color(0xffFF3E3E);

}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
