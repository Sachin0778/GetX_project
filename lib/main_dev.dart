import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_basics/config_dev.dart';
import 'package:getx_basics/core/localization/app_translations.dart';
import 'package:getx_basics/flavor_config.dart';
import 'package:getx_basics/presentation/controllers/auth_binding.dart';
import 'package:getx_basics/routes.dart';

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
    );
  }
}
