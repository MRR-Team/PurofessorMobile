import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/shared/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:purofessor_mobile/src/features/auth/data/data_sources/auth_data_source.dart';
import 'package:purofessor_mobile/src/features/profile/domain/usecases/update_profile_usecase.dart';

class ProfileController extends ChangeNotifier {
  final UpdateProfileUseCase updateProfileUseCase;
  final AuthController authController;
  final AuthDataSource authDataSource;

  ProfileController(
    this.updateProfileUseCase,
    this.authController,
    this.authDataSource,
  );

  bool _isEditing = false;
  bool get isEditing => _isEditing;

  User? get user => authController.user;

  void toggleEdit() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  Future<void> updateProfile({
    required BuildContext context,
    String? name,
    String? password,
  }) async {
    final messenger = ScaffoldMessenger.of(context);

    try {
      await updateProfileUseCase(name: name, password: password);

      final updatedUser = await authDataSource.fetchUserById(
        authController.user!.id,
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(updatedUser.toJson()));

      await authController.loadUser();

      if (context.mounted) {
        messenger.showSnackBar(
          const SnackBar(content: Text('Zaktualizowano profil')),
        );
      }
      toggleEdit();
    } catch (e) {
      if (context.mounted) {
        messenger.showSnackBar(
          const SnackBar(content: Text('Błąd aktualizacji profilu')),
        );
      }
    }
  }
}
