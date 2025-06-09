import 'package:purofessor_mobile/src/features/item_build/domain/models/build_item.dart';

abstract class BuildItemsRepository {
  Future<List<BuildItem>> getBuildItems(int enemyChampionId, int championId);
}
