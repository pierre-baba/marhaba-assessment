import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/utils/navigator.dart';
import 'package:marhaba_auctions_assessment/modules/home/controller/home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultSettings {
  static const String _defaultLanguage = 'en';
  static const String fallBackLanguage = 'en';

  static const bool _defaultTheme = false; // false == light theme

  static SharedPreferences? _storage;

  static String get language  =>
      _storage?.getString('language') ?? _defaultLanguage;

  static bool get isLanguageSet  =>
      _storage?.getBool('is_lang_set') ?? false;

  static void _setLanguage(String language) =>
      _storage?.setString('language', language);

  static void setIsLanguageSet(bool b) => _storage?.setBool('is_lang_set', b);

  static void toggleLanguage() async {
    if (kDebugMode) {
      print(Get.locale!.languageCode);
    }
    Get.updateLocale(Locale(Get.locale!.languageCode == 'en' ? 'ar' : 'en'));
    _setLanguage(Get.locale!.languageCode);
    AppNavigator.exitAllThenToHome();

    //todo restart main requests
  }

  static Future<void> initStorage() async {
    _storage = await SharedPreferences.getInstance();
  }

  static bool get theme  =>
       _storage?.getBool('theme') ?? _defaultTheme;

  static void setTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    _storage?.setBool('theme', !Get.isDarkMode);
    Get.find<HomeController>().update();
  }
}
