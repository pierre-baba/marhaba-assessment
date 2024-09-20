import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marhaba_auctions_assessment/core/themes/app_theme_data.dart';
import 'package:marhaba_auctions_assessment/core/utils/default_settings.dart';
import 'package:marhaba_auctions_assessment/data/providers/api_provider.dart';
import 'package:marhaba_auctions_assessment/routes/app_pages.dart';
import 'package:marhaba_auctions_assessment/translation/translations.dart';

// import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = MyHttpOverrides();
  await ScreenUtil.ensureScreenSize();

  await DefaultSettings.initStorage();
  var lang = DefaultSettings.language;
  var theme = DefaultSettings.theme;


  runApp(
    // MyApp()
    ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          initialBinding: InitialBinding(),
          builder: (ctx, widget) {
            final MediaQueryData data = MediaQuery.of(ctx);
            return MediaQuery(
                data: data.copyWith(textScaleFactor: 1.0), child: widget!);
          },
          debugShowCheckedModeBanner: false,
          title: "Marhaba Auctions",
          initialRoute: Routes.register,
          getPages: AppPages.routes,
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,
          themeMode: theme ? ThemeMode.dark : ThemeMode.light,
          // transitionDuration: const Duration(milliseconds: 200),
          // defaultTransition: Transition.leftToRight,
          translations: AppTranslation(),
          locale: Locale(lang),
          supportedLocales: const [Locale('ar'), Locale('en')],
          fallbackLocale: const Locale(DefaultSettings.fallBackLanguage),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      },
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Get.put(ApiRequests());
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {}
}
