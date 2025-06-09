import 'package:purofessor_mobile/src/shared/domain/models/user_model.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<void> register(
    String email,
    String name,
    String password,
    String confirmPassword,
  );
  Future<void> logout();
  Future<void> forgotPassword(String email);
}
