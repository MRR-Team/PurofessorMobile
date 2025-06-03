import 'package:purofessor_mobile/src/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<void> call(String email, String password) {
    return repository.login(email, password);
  }

  AuthRepository get getRepository => repository;
}
