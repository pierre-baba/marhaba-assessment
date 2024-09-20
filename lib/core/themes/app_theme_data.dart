import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marhaba_auctions_assessment/core/values/colors.dart';

import '../utils/locale_edge_insets.dart';
import '../values/text_styles.dart';
import 'border_styles.dart';

class AppThemeData {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
      },
    ),
    cardTheme: const CardTheme(
      color: AppColors.lightWhite,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.lightWhite),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      titleTextStyle:
          TextStyles.h3TextStyle.copyWith(color: AppColors.lightBlack),
    ),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.lightWhite,
      filled: true,
      focusColor: AppColors.lightGrey,
      contentPadding: LocaleEdgeInsets.only(
        start: 14.w,
        end: 15.w,
        top: 20.h,
        bottom: 20.h,
      ),
      disabledBorder: BorderStyles.textFieldLightBorders
          .copyWith(borderSide: const BorderSide(color: AppColors.lightGrey)),
      enabledBorder: BorderStyles.textFieldLightBorders.copyWith(
          borderSide: const BorderSide(
        color: AppColors.lightBlack,
        width: 2,
      )),
      errorBorder: BorderStyles.textFieldLightBorders.copyWith(
          borderSide: const BorderSide(
        color: AppColors.lightError,
        width: 2,
      )),
      focusedBorder: BorderStyles.textFieldLightBorders.copyWith(
          borderSide: const BorderSide(
        color: AppColors.lightBlack,
        width: 2,
      )),
      border: BorderStyles.textFieldLightBorders.copyWith(
          borderSide: const BorderSide(
        color: AppColors.lightBlack,
        width: 2,
      )),
    ),
    scaffoldBackgroundColor: AppColors.lightBackground,
    textTheme: TextTheme(
      headlineLarge:
          TextStyles.h1TextStyle.copyWith(color: AppColors.lightBlack),
      headlineMedium:
          TextStyles.h2TextStyle.copyWith(color: AppColors.lightBlack),
      headlineSmall:
          TextStyles.h3TextStyle.copyWith(color: AppColors.lightBlack),
      titleMedium: TextStyles.titleMedium.copyWith(color: AppColors.lightBlack),
      bodyLarge: TextStyles.bodyLarge.copyWith(color: AppColors.lightBlack),
      bodyMedium: TextStyles.bodyMedium.copyWith(color: AppColors.lightBlack),
      bodySmall: TextStyles.bodySmall.copyWith(color: AppColors.lightBlack),
      labelSmall: TextStyles.labelSmall.copyWith(color: AppColors.lightBlack),
      labelLarge: TextStyles.labelLarge.copyWith(color: AppColors.lightBlack),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
      },
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      titleTextStyle:
          TextStyles.h3TextStyle.copyWith(color: AppColors.darkWhite),
    ),
    cardTheme: const CardTheme(
      color: AppColors.darkDark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.darkDark,
      filled: true,
      focusColor: AppColors.darkGrey,
      contentPadding: LocaleEdgeInsets.only(
        start: 14.w,
        end: 15.w,
        top: 20.h,
        bottom: 20.h,
      ),
      disabledBorder: BorderStyles.textFieldLightBorders
          .copyWith(borderSide: const BorderSide(color: AppColors.darkGrey)),
      enabledBorder: BorderStyles.textFieldLightBorders.copyWith(
          borderSide: const BorderSide(
        color: AppColors.darkWhite,
        width: 2,
      )),
      errorBorder: BorderStyles.textFieldLightBorders.copyWith(
          borderSide: const BorderSide(
        color: AppColors.darkError,
        width: 2,
      )),
      focusedBorder: BorderStyles.textFieldLightBorders.copyWith(
          borderSide: const BorderSide(
        color: AppColors.darkWhite,
        width: 2,
      )),
      border: BorderStyles.textFieldLightBorders.copyWith(
          borderSide: const BorderSide(
        color: AppColors.darkWhite,
        width: 2,
      )),
    ),
    textTheme: TextTheme(
      headlineLarge:
          TextStyles.h1TextStyle.copyWith(color: AppColors.darkWhite),
      headlineMedium:
          TextStyles.h2TextStyle.copyWith(color: AppColors.darkWhite),
      headlineSmall:
          TextStyles.h3TextStyle.copyWith(color: AppColors.darkWhite),
      titleMedium: TextStyles.titleMedium.copyWith(color: AppColors.darkWhite),
      bodyLarge: TextStyles.bodyLarge.copyWith(color: AppColors.darkWhite),
      bodyMedium: TextStyles.bodyMedium.copyWith(color: AppColors.darkWhite),
      bodySmall: TextStyles.bodySmall.copyWith(color: AppColors.darkWhite),
      labelSmall: TextStyles.labelSmall.copyWith(color: AppColors.darkWhite),
      labelLarge: TextStyles.labelLarge.copyWith(color: AppColors.darkWhite),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
