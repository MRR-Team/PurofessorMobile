import 'package:purofessor_mobile/src/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  Future<void> call(
    String email,
    String name,
    String password,
    String confirmPassword,
  ) {
    return _repository.register(email, name, password, confirmPassword);
  }
}
