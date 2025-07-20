class FlavorConfig {
  final String baseUrl;
  final String flavorName;

  const FlavorConfig._internal(this.baseUrl, this.flavorName);

  static late final FlavorConfig instance;

  static void initialize({required String baseUrl, required String flavorName}) {
    instance = FlavorConfig._internal(baseUrl, flavorName);
  }
} 