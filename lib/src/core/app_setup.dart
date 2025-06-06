import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/core/data/network/http_client.dart';

import 'package:purofessor_mobile/src/core/constants/app_constatns.dart';
import 'package:purofessor_mobile/src/features/auth/data/data_sources/auth_data_source.dart';
import 'package:purofessor_mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/pages/login_page.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/pages/register_page.dart';
import 'package:purofessor_mobile/src/features/home/presentation/pages/home_page.dart';
import 'package:purofessor_mobile/src/core/routes/app_routes.dart';
import 'package:purofessor_mobile/src/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:purofessor_mobile/src/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:purofessor_mobile/src/features/profile/presentation/controllers/profile_controller.dart';
import 'package:purofessor_mobile/src/features/profile/presentation/pages/profile_page.dart';
import 'package:purofessor_mobile/src/shared/presentation/controllers/navbar_controllers.dart';

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
    final logoutUseCase = LogoutUseCase(authRepository);

    final authController = AuthController(
      loginUseCase: loginUseCase,
      registerUseCase: registerUseCase,
      logoutUseCase: logoutUseCase,
    );
    await authController.loadUser();

    final profileRepository = ProfileRepositoryImpl(httpClient, authController);
    final updateProfileUseCase = UpdateProfileUseCase(profileRepository);
    final profileController = ProfileController(
      updateProfileUseCase,
      authController,
      authDataSource,
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>.value(value: authController),
        ChangeNotifierProvider(create: (_) => NavbarController()),
        ChangeNotifierProvider<ProfileController>.value(
          value: profileController,
        ),
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
        // AppRoutes.settings: (context) => const SettingsPage(),
        AppRoutes.profile: (context) => const ProfilePage(),
      },
    );
  }
}
