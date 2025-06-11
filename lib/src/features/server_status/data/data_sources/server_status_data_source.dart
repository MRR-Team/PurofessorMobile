import 'package:purofessor_mobile/src/core/data/network/http_client.dart';
import 'package:purofessor_mobile/src/features/server_status/domain/models/server_status_model.dart';

class ServerStatusDataSource {
  final HttpClient httpClient;

  ServerStatusDataSource(this.httpClient);

  Future<ServerStatusModel> fetchStatus(String region) async {
    final response = await httpClient.get('/api/riot/status/$region');
    return ServerStatusModel.fromJson(response, region);
  }
}
