import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<void> call({
    required BuildContext context,
    String? name,
    String? password,
  }) {
    return repository.updateProfile(
      context: context,
      name: name,
      password: password,
    );
  }
}
