import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/config_prod.dart';
import 'package:getx_basics/routes.dart';
import 'presentation/controllers/auth_binding.dart';
import 'core/localization/app_translations.dart';
import 'flavor_config.dart';

void main() {
  setupFlavor();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Basics (${FlavorConfig.instance.flavorName})',
      initialRoute: '/login',
      initialBinding: AuthBinding(),
      getPages: routes,
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Banner(
        message: '${FlavorConfig.instance.flavorName} | ${FlavorConfig.instance.baseUrl}',
        location: BannerLocation.topEnd,
        child: child!,
      ),
    );
  }
}
