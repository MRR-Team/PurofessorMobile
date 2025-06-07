import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:purofessor_mobile/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:purofessor_mobile/src/core/data/network/http_client.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final HttpClient httpClient;
  final AuthController authController;

  ProfileRepositoryImpl(this.httpClient, this.authController);

  @override
  Future<void> updateProfile({String? name, String? password}) async {
    final userId = authController.user?.id;

    if (userId == null) {
      throw Exception('Brak zalogowanego użytkownika');
    }

    final body = <String, dynamic>{};
    if (name != null && name.isNotEmpty) body['name'] = name;
    if (password != null && password.isNotEmpty) body['password'] = password;

    await httpClient.put('/api/users/$userId', body: body);
  }
}
