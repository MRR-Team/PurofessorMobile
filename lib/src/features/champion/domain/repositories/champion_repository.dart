import 'package:purofessor_mobile/src/features/champion/domain/models/champion_model.dart';

abstract class ChampionRepository {
  Future<List<ChampionModel>> getChampions();
  Future<ChampionModel> getChampionDetails(int id);
}
