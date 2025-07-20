import '../entities/user_entity.dart';

abstract class AuthUseCase {
  Future<UserEntity?> login(String email, String password);
  Future<void> logout();
  Future<UserEntity?> checkAuth();
} 