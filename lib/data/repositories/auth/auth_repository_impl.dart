import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/auth_usecases.dart';

class AuthRepositoryImpl implements AuthUseCase {
  UserEntity? _currentUser;

  @override
  Future<UserEntity?> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));
    // Fake user
    _currentUser = UserEntity(
      id: '1',
      name: 'John Doe',
      email: email,
    );
    return _currentUser;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(Duration(milliseconds: 500));
    _currentUser = null;
  }

  @override
  Future<UserEntity?> checkAuth() async {
    await Future.delayed(Duration(milliseconds: 500));
    return _currentUser;
  }
} 