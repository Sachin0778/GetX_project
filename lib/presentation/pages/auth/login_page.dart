import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/core/localization/language_switcher.dart';
import '../../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.tr),
        actions: const [LanguageSwitcher()],
      ),
      body: Obx(() => authController.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'email'.tr),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'password'.tr),
                    obscureText: true,
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () async {
                      await authController.login(
                        emailController.text,
                        passwordController.text,
                      );
                      if (authController.user.value != null) {
                        Get.offAllNamed('/dashboard');
                      }
                    },
                    child: Text('login'.tr),
                  ),
                ],
              ),
            )),
    );
  }
} 