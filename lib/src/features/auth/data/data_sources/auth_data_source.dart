import 'dart:convert';
import 'package:purofessor_mobile/src/core/data/network/http_client.dart';
import 'package:purofessor_mobile/src/shared/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataSource {
  final HttpClient httpClient;

  AuthDataSource(this.httpClient);

  Future<void> login(String email, String password) async {
    final response = await httpClient.post(
      '/api/login',
      body: {'email': email, 'password': password},
    );

    final token = response['token'];
    final user = User.fromJson(response['user']);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('user', jsonEncode(user.toJson()));
  }

  Future<void> register(
    String email,
    String name,
    String password,
    String confirmPassword,
  ) async {
    httpClient.post(
      '/api/users',
      body: {
        'email': email,
        'name': name,
        'password': password,
        'password_confirmation': confirmPassword,
      },
    );
  }

  Future<void> logout() async {
    await httpClient.post('/api/logout');
  }

  Future<User> fetchUserById(int id) async {
    final response = await httpClient.get('/api/users/$id');
    return User.fromJson(response);
  }
}
