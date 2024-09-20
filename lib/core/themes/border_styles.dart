import 'package:marhaba_auctions_assessment/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marhaba_auctions_assessment/core/values/dimentions.dart';

class BorderStyles {
  static OutlineInputBorder textFieldDarkBorders = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.borderRadius.r),
      borderSide: const BorderSide(color: AppColors.lightBlack, width: 2));

  static OutlineInputBorder textFieldLightBorders = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.borderRadius.r),
      borderSide: const BorderSide(color: AppColors.lightBlack, width: 2));

  static OutlineInputBorder noBorders = const OutlineInputBorder(
      // borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
      borderSide: BorderSide(color: Colors.transparent, width: 0));
}
