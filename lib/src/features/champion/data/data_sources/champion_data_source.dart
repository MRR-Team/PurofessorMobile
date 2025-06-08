import 'package:purofessor_mobile/src/core/data/network/http_client.dart';

class ChampionDataSource {
  final HttpClient httpClient;

  ChampionDataSource(this.httpClient);

  Future<List<Map<String, dynamic>>> getAvailableChampions() async {
    final response = await httpClient.get('/api/available-champions');
    return List<Map<String, dynamic>>.from(response);
  }
}
