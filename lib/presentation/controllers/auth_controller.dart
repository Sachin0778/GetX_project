import 'package:get/get.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/auth_usecases.dart';

class AuthController extends GetxController {
  final AuthUseCase authUseCase;
  Rxn<UserEntity> user = Rxn<UserEntity>();
  RxBool isLoading = false.obs;

  AuthController(this.authUseCase);

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    user.value = await authUseCase.login(email, password);
    isLoading.value = false;
  }

  Future<void> logout() async {
    isLoading.value = true;
    await authUseCase.logout();
    user.value = null;
    isLoading.value = false;
  }

  Future<void> checkAuth() async {
    isLoading.value = true;
    user.value = await authUseCase.checkAuth();
    isLoading.value = false;
  }
} 