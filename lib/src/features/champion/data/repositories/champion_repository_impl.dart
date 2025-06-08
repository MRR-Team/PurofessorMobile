import 'package:purofessor_mobile/src/features/champion/domain/models/champion_model.dart';
import 'package:purofessor_mobile/src/features/champion/domain/repositories/champion_repository.dart';
import 'package:purofessor_mobile/src/features/champion/data/data_sources/champion_data_source.dart';

class ChampionRepositoryImpl implements ChampionRepository {
  final ChampionDataSource dataSource;

  ChampionRepositoryImpl(this.dataSource);

  @override
  Future<List<ChampionModel>> getChampions() async {
    final data = await dataSource.getChampions();
    return data.map((e) => ChampionModel.fromJson(e)).toList();
  }

  @override
  Future<ChampionModel> getChampionDetails(int id) async {
    final data = await dataSource.getChampionDetails(id);
    return ChampionModel.fromJson(data);
  }
}
