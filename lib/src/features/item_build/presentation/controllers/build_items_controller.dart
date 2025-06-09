import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/features/item_build/domain/models/build_item.dart';
import 'package:purofessor_mobile/src/features/item_build/domain/usecases/get_build_items_usecase.dart';
import 'package:purofessor_mobile/src/core/exceptions/no_internet_exception.dart';
import 'package:purofessor_mobile/src/core/exceptions/http_exception.dart';
import 'package:purofessor_mobile/src/core/exceptions/message_exception.dart';

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
      _errorMessage = null;
    } on NoInternetException catch (e) {
      _errorMessage = e.message;
      _state = BuildItemsState.error;
    } on HttpException catch (e) {
      _errorMessage = e.message;
      _state = BuildItemsState.error;
    } on MessageException catch (e) {
      _errorMessage = e.message;
      _state = BuildItemsState.error;
    } catch (_) {
      _errorMessage = 'Coś poszło nie tak. Spróbuj ponownie.';
      _state = BuildItemsState.error;
    }

    notifyListeners();
  }
}
