import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purofessor_mobile/src/core/app_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final app = await AppSetup.initialize();
  runApp(app);
}
