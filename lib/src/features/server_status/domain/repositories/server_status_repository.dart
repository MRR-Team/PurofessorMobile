import 'package:purofessor_mobile/src/features/server_status/domain/models/server_status_model.dart';

abstract class ServerStatusRepository {
  Future<ServerStatusModel> getStatus(String region);
}
