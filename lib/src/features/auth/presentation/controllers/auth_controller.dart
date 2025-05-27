import 'package:purofessor_mobile/src/core/data/network/http_client.dart';
import 'package:purofessor_mobile/src/core/exceptions/http_exception.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  final HttpClient httpClient;

  AuthController({required this.httpClient});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(BuildContext context, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await httpClient.post(
        '/api/login',
        body: {
          'email': email,
          'password': password,
        },
      );

      final token = response['token'];

      if (context.mounted) {
        print("gowno");
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    } on HttpException catch (e) {
      _showError(context, e.message);
    } catch (_) {
      _showError(context, 'Coś poszło nie tak. Spróbuj ponownie.');
    }

    _isLoading = false;
    notifyListeners();
  }

  void _showError(BuildContext context, String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  }
}
