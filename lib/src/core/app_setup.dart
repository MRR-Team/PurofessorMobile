import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/core/data/network/http_client.dart';

import 'package:purofessor_mobile/src/core/constants/app_constatns.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:purofessor_mobile/src/features/home/presentation/pages/home_page.dart';

class AppSetup {
  static Future<Widget> initialize() async {
    await dotenv.load(fileName: '.env');

    final apiUrl = dotenv.env['API_URL'];

    if (apiUrl == null || apiUrl.isEmpty) {
      throw Exception('API_URL is not set in the .env file');
    }

    final httpClient = HttpClient(baseUrl: apiUrl);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController(httpClient: httpClient)),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}
