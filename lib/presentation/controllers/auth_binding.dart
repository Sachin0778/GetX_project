import 'package:get/get.dart';
import '../../data/repositories/auth/auth_repository_impl.dart';
import '../../domain/usecases/auth_usecases.dart';
import 'auth_controller.dart';
import '../bindings/news_binding.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthUseCase>(() => AuthRepositoryImpl());
    Get.lazyPut(() => AuthController(Get.find<AuthUseCase>()));
    
    // Initialize news dependencies
    NewsBinding().dependencies();
  }
} 