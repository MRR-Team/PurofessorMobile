import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:purofessor_mobile/src/core/routes/app_routes.dart';
import 'package:purofessor_mobile/src/core/exceptions/http_exception.dart';
import 'package:purofessor_mobile/src/shared/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;

  AuthController({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  User? _user;
  User? get user => _user;

  bool get isLoggedIn => _user != null;

  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      await loginUseCase(email, password);
      await loadUser();

      if (context.mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Zalogowano pomyślnie')));
      }
    } on HttpException catch (e) {
      _showError(context, e.message);
    } catch (_) {
      _showError(context, 'Coś poszło nie tak. Spróbuj ponownie.');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> register(
    BuildContext context,
    String email,
    String name,
    String password,
    String confirmPassword,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      await registerUseCase(email, name, password, confirmPassword);
      await loadUser();

      if (context.mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Zarejestrowano pomyślnie')),
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

  Future<void> logout(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      await logoutUseCase();

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('user');

      _user = null;

      if (context.mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    } on HttpException catch (e) {
      _showError(context, e.message);
    } catch (_) {
      _showError(context, 'Błąd wylogowywania.');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson != null) {
      _user = User.fromJson(jsonDecode(userJson));
    } else {
      _user = null;
    }
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
