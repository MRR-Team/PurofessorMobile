import 'package:purofessor_mobile/src/features/item_build/data/data_sources/build_item_data_source.dart';
import 'package:purofessor_mobile/src/features/item_build/domain/models/build_item.dart';
import 'package:purofessor_mobile/src/features/item_build/domain/repositories/build_items_repository.dart';

class BuildItemsRepositoryImpl implements BuildItemsRepository {
  final BuildItemsDataSource remoteDataSource;

  BuildItemsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<BuildItem>> getBuildItems(int enemyChampionId, int championId) {
    return remoteDataSource.fetchBuildItems(enemyChampionId, championId);
  }
}
