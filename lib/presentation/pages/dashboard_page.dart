import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/core/localization/language_switcher.dart';
import 'package:getx_basics/presentation/controllers/auth_controller.dart';
import 'package:getx_basics/presentation/controllers/news_controller.dart';
import 'package:getx_basics/presentation/pages/news/news_page.dart';
import 'package:getx_basics/presentation/pages/voice/voice_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    // Ensure news controller is available
    Get.put(NewsController());
    
    final AuthController authController = Get.find();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('dashboard'.tr),
          actions: [
            const LanguageSwitcher(),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await authController.logout();
                Get.offAllNamed('/login');
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'home'.tr),
              Tab(text: 'profile'.tr),
              Tab(text: 'news'.tr),
              Tab(text: 'voice'.tr),
              Tab(text: 'settings'.tr),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('welcome_home'.tr)), // Home
            Obx(() => Center(
                  child: authController.user.value == null
                      ? Text('no_user'.tr)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${'name'.tr}: ${authController.user.value!.name}'),
                            Text('${'email'.tr}: ${authController.user.value!.email}'),
                          ],
                        ),
                )), // Profile
            const NewsPage(),
            const VoicePage(),
            Center(child: Text('settings_tab'.tr)), // Settings
          ],
        ),
      ),
    );
  }
} 