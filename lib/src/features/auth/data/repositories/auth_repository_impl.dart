import 'package:purofessor_mobile/src/features/auth/data/data_sources/auth_data_source.dart';
import 'package:purofessor_mobile/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<void> login(String email, String password) {
    return dataSource.login(email, password);
  }

  @override
  Future<Map<String, dynamic>?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');

    if (userJson == null) return null;

    return jsonDecode(userJson);
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
}
