import 'package:purofessor_mobile/src/features/champion/domain/models/champion_model.dart';
import 'package:purofessor_mobile/src/features/champion/domain/repositories/champion_repository.dart';

class FetchChampionsUseCase {
  final ChampionRepository repo;
  FetchChampionsUseCase(this.repo);

  Future<List<ChampionModel>> call() {
    return repo.getAvailableChampions();
  }
}
