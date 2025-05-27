import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/core/app_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = await AppSetup.initialize();
  runApp(app);
}
