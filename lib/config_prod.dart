import 'flavor_config.dart';

void setupFlavor() {
  FlavorConfig.initialize(
    baseUrl: 'https://api.example.com',
    flavorName: 'prod',
  );
} 