import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/core/routes/app_routes.dart';
import 'package:purofessor_mobile/src/core/exceptions/http_exception.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/login_usecase.dart';

class AuthController extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  AuthController({required this.loginUseCase});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(BuildContext context, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await loginUseCase(email, password);

      if (context.mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Zalogowano pomyślnie')),
        );
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
