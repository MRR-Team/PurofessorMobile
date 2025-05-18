import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void login(BuildContext context, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Zalogowano pomyślnie')));
    }
  }

  void register(BuildContext context, String email, String name, String password, String confirmPassword) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Zarejestrowano pomyślnie')));
    }
  }
}
