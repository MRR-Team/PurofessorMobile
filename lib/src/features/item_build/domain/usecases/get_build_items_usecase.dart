import 'package:purofessor_mobile/src/features/item_build/domain/models/build_item.dart';
import 'package:purofessor_mobile/src/features/item_build/domain/repositories/build_items_repository.dart';

class GetBuildItemsUsecase {
  final BuildItemsRepository repository;

  GetBuildItemsUsecase(this.repository);

  Future<List<BuildItem>> call(int enemyChampionId, int championId) {
    return repository.getBuildItems(enemyChampionId, championId);
  }
}
