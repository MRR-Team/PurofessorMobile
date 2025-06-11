import 'package:purofessor_mobile/src/features/server_status/data/data_sources/server_status_data_source.dart';
import 'package:purofessor_mobile/src/features/server_status/domain/models/server_status_model.dart';
import 'package:purofessor_mobile/src/features/server_status/domain/repositories/server_status_repository.dart';

class ServerStatusRepositoryImpl implements ServerStatusRepository {
  final ServerStatusDataSource dataSource;

  ServerStatusRepositoryImpl(this.dataSource);

  @override
  Future<ServerStatusModel> getStatus(String region) =>
      dataSource.fetchStatus(region);
}
