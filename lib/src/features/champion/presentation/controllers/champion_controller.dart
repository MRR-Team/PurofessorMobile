import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/core/exceptions/http_exception.dart';
import 'package:purofessor_mobile/src/features/champion/domain/models/champion_model.dart';
import 'package:purofessor_mobile/src/features/champion/domain/repositories/champion_repository.dart';

class ChampionController extends ChangeNotifier {
  final ChampionRepository repository;

  ChampionController(this.repository);

  List<ChampionModel> _champions = [];
  List<ChampionModel> get champions => _champions;

  List<ChampionModel> _filtered = [];
  List<ChampionModel> get filteredChampions => _filtered;

  List<String> selectedPositions = [];
  String query = '';
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchChampions(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      _champions = await repository.getChampions();
      applyFilters();
    } on HttpException catch (e) {
      if (context.mounted) _showError(context, e.message);
    } catch (_) {
      if (context.mounted) _showError(context, 'Wystąpił nieoczekiwany błąd.');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<ChampionModel> fetchChampionDetails(int id) async {
    return await repository.getChampionDetails(id);
  }

  void updateQuery(String value) {
    query = value.toLowerCase();
    applyFilters();
  }

  void togglePosition(String position) {
    if (selectedPositions.contains(position)) {
      selectedPositions.clear();
    } else {
      selectedPositions = [position];
    }
    applyFilters();
  }

  void applyFilters() {
    _filtered =
        _champions.where((champ) {
          final matchesQuery = champ.name.toLowerCase().startsWith(query);
          final matchesPosition =
              selectedPositions.isEmpty ||
              selectedPositions
                  .map((e) => e.toLowerCase())
                  .contains(champ.position.toLowerCase());
          return matchesQuery && matchesPosition;
        }).toList();

    notifyListeners();
  }

  void _showError(BuildContext context, String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> load(BuildContext context) => fetchChampions(context);

  Future<List<ChampionModel>> fetchCounters({
    required String role,
    required int enemyChampionId,
  }) async {
    return await repository.getCounters(role: role, enemyChampionId: enemyChampionId);
  }
}
