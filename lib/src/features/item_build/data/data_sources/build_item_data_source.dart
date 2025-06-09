import 'package:purofessor_mobile/src/core/data/network/http_client.dart';
import 'package:purofessor_mobile/src/features/item_build/domain/models/build_item.dart';

class BuildItemsDataSource {
  final HttpClient httpClient;

  BuildItemsDataSource(this.httpClient);

  Future<List<BuildItem>> fetchBuildItems(
    int enemyChampionId,
    int championId,
  ) async {
    final response = await httpClient.get(
      '/api/build/$enemyChampionId/against/$championId',
    );
    return (response as List)
        .map((json) => BuildItem.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }
}
