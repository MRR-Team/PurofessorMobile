import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:purofessor_mobile/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:purofessor_mobile/src/core/data/network/http_client.dart';
import 'package:purofessor_mobile/l10n/generated/app_localizations.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final HttpClient httpClient;
  final AuthController authController;

  ProfileRepositoryImpl(this.httpClient, this.authController);

  @override
  Future<void> updateProfile({
    required BuildContext context,
    String? name,
    String? password,
  }) async {
    final localizations = AppLocalizations.of(context)!;
    final userId = authController.user?.id;

    if (userId == null) {
      throw Exception(localizations.noLoggedUser);
    }

    final body = <String, dynamic>{};
    if (name != null && name.isNotEmpty) body['name'] = name;
    if (password != null && password.isNotEmpty) body['password'] = password;

    await httpClient.put('/api/users/$userId', body: body);
  }
}
