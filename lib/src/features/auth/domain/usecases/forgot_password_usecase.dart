import 'package:purofessor_mobile/src/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  Future<void> call(String email) {
    return repository.forgotPassword(email);
  }
}
