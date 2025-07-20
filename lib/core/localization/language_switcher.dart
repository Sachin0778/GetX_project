import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      onSelected: (locale) => Get.updateLocale(locale),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: const Locale('en', 'US'),
          child: Text('English'),
        ),
        PopupMenuItem(
          value: const Locale('es', 'ES'),
          child: Text('Español'),
        ),
      ],
    );
  }
} 