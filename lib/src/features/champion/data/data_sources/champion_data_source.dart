import 'package:purofessor_mobile/src/core/data/network/http_client.dart';

class ChampionDataSource {
  final HttpClient httpClient;

  ChampionDataSource(this.httpClient);

  Future<List<Map<String, dynamic>>> getChampions() async {
    final response = await httpClient.get('/api/champions');
    return List<Map<String, dynamic>>.from(response);
  }

  Future<Map<String, dynamic>> getChampionDetails(int id) async {
    final response = await httpClient.get('/api/champions/$id');
    return Map<String, dynamic>.from(response);
  }

  Future<List<Map<String, dynamic>>> getCounters({
    required String role,
    required int enemyChampionId,
  }) async {
    final response = await httpClient.get(
      '/api/counter/$role/$enemyChampionId',
    );
    return List<Map<String, dynamic>>.from(response);
  }
}
