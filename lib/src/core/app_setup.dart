import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'package:purofessor_mobile/src/core/data/network/http_client.dart';
import 'package:purofessor_mobile/src/core/data/network/services/google_auth_service.dart';
import 'package:purofessor_mobile/src/core/presentation/app_initializer.dart';
import 'package:purofessor_mobile/src/features/auth/data/data_sources/auth_data_source.dart';
import 'package:purofessor_mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/google_login_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:purofessor_mobile/src/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:purofessor_mobile/src/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:purofessor_mobile/src/features/profile/presentation/controllers/profile_controller.dart';
import 'package:purofessor_mobile/src/features/champion/data/data_sources/champion_data_source.dart';
import 'package:purofessor_mobile/src/features/champion/data/repositories/champion_repository_impl.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/controllers/champion_controller.dart';
import 'package:purofessor_mobile/src/features/item_build/data/data_sources/build_item_data_source.dart';
import 'package:purofessor_mobile/src/features/item_build/data/repositories/build_items_repository_impl.dart';
import 'package:purofessor_mobile/src/features/item_build/domain/usecases/get_build_items_usecase.dart';
import 'package:purofessor_mobile/src/features/item_build/presentation/controllers/build_items_controller.dart';
import 'package:purofessor_mobile/src/features/server_status/data/data_sources/server_status_data_source.dart';
import 'package:purofessor_mobile/src/features/server_status/data/repositories/server_status_repository_impl.dart';
import 'package:purofessor_mobile/src/features/server_status/presentation/controllers/server_status_controller.dart';
import 'package:purofessor_mobile/src/shared/presentation/controllers/localization_controller.dart';
import 'package:purofessor_mobile/src/shared/presentation/controllers/navbar_controller.dart';
import 'package:purofessor_mobile/src/shared/presentation/controllers/theme_controller.dart';

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
    final forgotPasswordUseCase = ForgotPasswordUseCase(authRepository);
    final googleAuthService = GoogleAuthService(httpClient);
    final googleLoginUseCase = GoogleLoginUseCase(googleAuthService);

    final serverStatusDataSource = ServerStatusDataSource(httpClient);
    final serverStatusRepository = ServerStatusRepositoryImpl(
      serverStatusDataSource,
    );
    final serverStatusController = ServerStatusController(
      serverStatusRepository,
    );

    final authController = AuthController(
      loginUseCase: loginUseCase,
      registerUseCase: registerUseCase,
      logoutUseCase: logoutUseCase,
      forgotPasswordUseCase: forgotPasswordUseCase,
      googleLoginUseCase: googleLoginUseCase,
    );
    await authController.loadUser();

    final profileRepository = ProfileRepositoryImpl(httpClient, authController);
    final updateProfileUseCase = UpdateProfileUseCase(profileRepository);
    final profileController = ProfileController(
      updateProfileUseCase,
      authController,
      authDataSource,
    );

    final themeController = ThemeController();
    final localizationController = LocalizationController();
    await localizationController.loadLocale();

    final championDataSource = ChampionDataSource(httpClient);
    final championRepository = ChampionRepositoryImpl(championDataSource);
    final championController = ChampionController(championRepository);

    final buildItemsDataSource = BuildItemsDataSource(httpClient);
    final buildItemsRepository = BuildItemsRepositoryImpl(buildItemsDataSource);
    final getBuildItemsUsecase = GetBuildItemsUsecase(buildItemsRepository);
    final buildItemsController = BuildItemsController(getBuildItemsUsecase);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>.value(value: authController),
        ChangeNotifierProvider<ProfileController>.value(
          value: profileController,
        ),
        ChangeNotifierProvider<ThemeController>.value(value: themeController),
        ChangeNotifierProvider<LocalizationController>.value(
          value: localizationController,
        ),
        ChangeNotifierProvider<ChampionController>.value(
          value: championController,
        ),
        ChangeNotifierProvider<BuildItemsController>.value(
          value: buildItemsController,
        ),
        ChangeNotifierProvider(create: (_) => NavbarController()),
        ChangeNotifierProvider<ServerStatusController>.value(
          value: serverStatusController,
        ),
      ],
      child: const AppInitializer(),
    );
  }
}
