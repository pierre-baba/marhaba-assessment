import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/routes/app_pages.dart';

class AppNavigator {
  AppNavigator._();

  static Future? exitAllThenToRegister() async {
    return Get.offAllNamed(Routes.register);
  }

  static Future? offAllHome() async {
    return Get.offAllNamed(Routes.home);
  }

  static Future? exitAllThenToHome() async {
    return Get.offAllNamed(Routes.home);
  }
}
