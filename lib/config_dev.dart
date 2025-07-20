import 'flavor_config.dart';

void setupFlavor() {
  FlavorConfig.initialize(
    baseUrl: 'https://dev.api.example.com',
    flavorName: 'dev',
  );
} 