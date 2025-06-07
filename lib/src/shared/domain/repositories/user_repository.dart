import 'package:purofessor_mobile/src/shared/domain/models/user_model.dart';

abstract class UserRepository {
  Future<User> fetchById(int id);
}
