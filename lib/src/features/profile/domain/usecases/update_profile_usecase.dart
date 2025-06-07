import 'package:purofessor_mobile/src/features/profile/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<void> call({String? name, String? password}) {
    return repository.updateProfile(name: name, password: password);
  }
}
