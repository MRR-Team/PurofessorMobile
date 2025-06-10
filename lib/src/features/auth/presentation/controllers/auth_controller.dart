import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:purofessor_mobile/src/core/exceptions/auth_exception.dart';
import 'package:purofessor_mobile/src/core/exceptions/no_internet_exception.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/google_login_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:purofessor_mobile/src/core/routes/app_routes.dart';
import 'package:purofessor_mobile/src/core/exceptions/http_exception.dart';
import 'package:purofessor_mobile/src/shared/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthController extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GoogleLoginUseCase googleLoginUseCase;

  AuthController({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.forgotPasswordUseCase,
    required this.googleLoginUseCase,
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
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final localizations = AppLocalizations.of(context)!;
    _isLoading = true;
    notifyListeners();

    try {
      await loginUseCase(email, password);
      await loadUser();

      if (!context.mounted) return;

      navigator.pushReplacementNamed(AppRoutes.home);
      messenger.showSnackBar(
        SnackBar(content: Text(localizations.loginSuccess)),
      );
    } on NoInternetException catch (e) {
      if (context.mounted) {
        _showError(context, e.message);
      }
    } on AuthException catch (e) {
      if (context.mounted) {
        _showError(context, e.message);
      }
    } on HttpException catch (e) {
      if (context.mounted) {
        _showError(context, e.message);
      }
    } catch (_) {
      if (context.mounted) {
        _showError(context, localizations.unknownError);
      }
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
    final localizations = AppLocalizations.of(context)!;
    try {
      await registerUseCase(email, name, password, confirmPassword);
      if (!context.mounted) return;

      Navigator.pushReplacementNamed(context, AppRoutes.login);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(localizations.loginSuccess)));
    } on HttpException catch (e) {
      if (!context.mounted) return;
      _showError(context, e.message);
    } catch (_) {
      if (!context.mounted) return;
      _showError(context, localizations.unknownError);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    final navigator = Navigator.of(context);
    final localizations = AppLocalizations.of(context)!;
    _isLoading = true;
    notifyListeners();

    try {
      await logoutUseCase();
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('user');

      _user = null;

      try {
        await GoogleSignIn().signOut();
      } catch (_) {}

      if (context.mounted) {
        navigator.pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
      }
    } on HttpException catch (e) {
      if (context.mounted) {
        _showError(context, e.message);
      }
    } catch (_) {
      if (context.mounted) {
        _showError(context, localizations.logoutError);
      }
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

  Future<void> forgotPassword(BuildContext context, String email) async {
    _isLoading = true;
    notifyListeners();
    final localizations = AppLocalizations.of(context)!;

    try {
      await forgotPasswordUseCase(email);

      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(localizations.restPasswordLink)));
      }
    } on HttpException catch (e) {
      if (context.mounted) {
        _showError(context, e.message);
      }
    } catch (_) {
      if (context.mounted) {
        _showError(context, localizations.unknownError);
      }
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loginWithGoogle(BuildContext context) async {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final localizations = AppLocalizations.of(context)!;

    _isLoading = true;
    notifyListeners();

    try {
      final user = await googleLoginUseCase();
      _user = user;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(user.toJson()));
      if (!context.mounted) return;

      navigator.pushReplacementNamed(AppRoutes.home);
      messenger.showSnackBar(
        SnackBar(content: Text(localizations.loginSuccessGoogle)),
      );
    } on NoInternetException catch (e) {
      _showError(context, e.message);
    } on HttpException catch (e) {
      _showError(context, e.message);
    } catch (e) {
      _showError(context, localizations.loginGoogleError);
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
