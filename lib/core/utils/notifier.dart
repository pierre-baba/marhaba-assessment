import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/utils/loader.dart';
import 'package:marhaba_auctions_assessment/core/values/colors.dart';

import '../values/fonts.dart';

class Notifier {
  static Future<void> showSnackBar(String message,
      {String? title, bool error = false, int duration = 2500}) async {
    Get.snackbar(
      titleText: Text(title ?? message,
          style: TextStyle(
              color: error ? AppColors.lightError : AppColors.lightBackground,
              fontFamily: AppFonts.inter,
              fontWeight: FontWeight.bold)),
      messageText: Text(
        title == null ? '' : message,
        style: TextStyle(
            color: error ? AppColors.lightError : AppColors.lightBackground,
            fontFamily: AppFonts.inter,
            fontWeight: FontWeight.bold),
      ),
      title ?? message,
      title == null ? '' : message,
      colorText: error ? Colors.white : AppColors.lightBackground,
      backgroundColor: AppColors.lightBackground,
      duration: Duration(milliseconds: duration),
      forwardAnimationCurve: Curves.fastOutSlowIn,
      reverseAnimationCurve: Curves.fastOutSlowIn,
    );
  }

  static void showLoader() {
    Get.dialog(const DefaultLoader(),
        barrierDismissible: false, useSafeArea: true);
  }

  static void dismissLoader() {
    Get.back();
  }
}
