import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/features/server_status/data/repositories/server_status_repository_impl.dart';
import 'package:purofessor_mobile/src/features/server_status/domain/models/server_status_model.dart';

class ServerStatusController extends ChangeNotifier {
  final ServerStatusRepositoryImpl repository;

  ServerStatusModel? status;
  bool isLoading = false;
  String? error;

  ServerStatusController(this.repository);

  Future<void> fetchStatus(String region) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      status = await repository.getStatus(region);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
