import 'package:purofessor_mobile/src/features/auth/data/data_sources/auth_data_source.dart';
import 'package:purofessor_mobile/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<void> login(String email, String password) {
    return dataSource.login(email, password);
  }
}
