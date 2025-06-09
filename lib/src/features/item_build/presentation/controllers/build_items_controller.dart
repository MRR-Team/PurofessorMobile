import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/features/item_build/domain/models/build_item.dart';
import 'package:purofessor_mobile/src/features/item_build/domain/usecases/get_build_items_usecase.dart';

enum BuildItemsState { initial, loading, loaded, error }

class BuildItemsController extends ChangeNotifier {
  final GetBuildItemsUsecase getBuildItemsUsecase;

  BuildItemsController(this.getBuildItemsUsecase);

  BuildItemsState _state = BuildItemsState.initial;
  BuildItemsState get state => _state;

  List<BuildItem> _items = [];
  List<BuildItem> get items => _items;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadBuildItems(int enemyChampionId, int championId) async {
    _state = BuildItemsState.loading;
    notifyListeners();

    try {
      _items = await getBuildItemsUsecase.call(enemyChampionId, championId);
      _state = BuildItemsState.loaded;
    } catch (e) {
      _errorMessage = e.toString();
      _state = BuildItemsState.error;
    }
    notifyListeners();
  }
}
