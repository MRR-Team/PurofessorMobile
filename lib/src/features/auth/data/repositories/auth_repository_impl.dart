import 'package:purofessor_mobile/src/features/auth/data/data_sources/auth_data_source.dart';
import 'package:purofessor_mobile/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:purofessor_mobile/src/shared/domain/models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<User> login(String email, String password) {
    return dataSource.login(email, password);
  }

  @override
  Future<void> register(
    String email,
    String name,
    String password,
    String confirmPassword,
  ) {
    return dataSource.register(email, name, password, confirmPassword);
  }

  @override
  Future<void> logout() async {
    await dataSource.logout();
  }

  @override
  Future<void> forgotPassword(String email) {
    return dataSource.forgotPassword(email);
  }
}
