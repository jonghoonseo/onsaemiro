import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:onsaemiro/app/bindings/home_binding.dart';
import 'package:onsaemiro/app/routes/app_pages.dart';
import 'package:onsaemiro/app/translations/app_translations.dart';
import 'package:onsaemiro/app/ui/android/home/home_page.dart';
import 'package:onsaemiro/app/ui/theme/app_theme.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    locale: Locale('en', 'US'),
    translationsKeys: AppTranslation.translations,
  ));
}
