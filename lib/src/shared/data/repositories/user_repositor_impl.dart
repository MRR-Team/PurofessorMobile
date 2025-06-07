import 'package:purofessor_mobile/src/shared/domain/models/user_model.dart';
import 'package:purofessor_mobile/src/core/data/network/http_client.dart';
import 'package:purofessor_mobile/src/shared/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final HttpClient httpClient;

  UserRepositoryImpl(this.httpClient);

  @override
  Future<User> fetchById(int id) async {
    final response = await httpClient.get('/api/users/$id');
    return User.fromJson(response);
  }
}
