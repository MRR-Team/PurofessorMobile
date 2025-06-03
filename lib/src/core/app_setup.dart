import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/core/data/network/http_client.dart';

import 'package:purofessor_mobile/src/core/constants/app_constatns.dart';
import 'package:purofessor_mobile/src/features/auth/data/data_sources/auth_data_source.dart';
import 'package:purofessor_mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/pages/login_page.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/pages/register_page.dart';
import 'package:purofessor_mobile/src/features/home/presentation/pages/home_page.dart';
import 'package:purofessor_mobile/src/core/routes/app_routes.dart';

class AppSetup {
  static Future<Widget> initialize() async {
    await dotenv.load(fileName: '.env');

    final apiUrl = dotenv.env['API_URL'];

    if (apiUrl == null || apiUrl.isEmpty) {
      throw Exception('API_URL is not set in the .env file');
    }

    final httpClient = HttpClient(baseUrl: apiUrl);
    final authDataSource = AuthDataSource(httpClient);
    final authRepository = AuthRepositoryImpl(authDataSource);
    final loginUseCase = LoginUseCase(authRepository);
    final registerUseCase = RegisterUseCase(authRepository);
    final authController = AuthController(
      loginUseCase: loginUseCase,
      registerUseCase: registerUseCase,
    );
    await authController.loadUser();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>.value(value: authController),
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
      initialRoute: '/home',
      routes: {
        AppRoutes.login: (context) => LoginPage(),
        AppRoutes.register: (context) => RegisterPage(),
        AppRoutes.home: (context) => const HomePage(),
      },
    );
  }
}
