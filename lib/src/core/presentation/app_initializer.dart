import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/l10n/generated/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:purofessor_mobile/src/core/constants/app_constatns.dart';
import 'package:purofessor_mobile/src/core/routes/app_routes.dart';

import 'package:purofessor_mobile/src/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/pages/login_page.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/pages/register_page.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/pages/champion_details_page.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/pages/champion_search_page.dart';
import 'package:purofessor_mobile/src/features/home/presentation/pages/home_page.dart';
import 'package:purofessor_mobile/src/features/item_build/presentation/pages/build_items_page.dart';
import 'package:purofessor_mobile/src/features/profile/presentation/pages/profile_page.dart';
import 'package:purofessor_mobile/src/features/settings/presentation/pages/settings_page.dart';
import 'package:purofessor_mobile/src/shared/presentation/controllers/localization_controller.dart';
import 'package:purofessor_mobile/src/shared/presentation/controllers/theme_controller.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context) {
    final localizationController = Provider.of<LocalizationController>(context);
    final themeController = Provider.of<ThemeController>(context);

    return MaterialApp(
      title: AppConstants.appName,
      themeMode: themeController.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.transparent,
        primarySwatch: Colors.deepPurple,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.transparent,
        primarySwatch: Colors.deepPurple,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor: Colors.grey,
        ),
      ),
      locale: localizationController.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('pl')],
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.login: (context) => LoginPage(),
        AppRoutes.register: (context) => RegisterPage(),
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.settings: (context) => const SettingsPage(),
        AppRoutes.profile: (context) => const ProfilePage(),
        AppRoutes.championSearch: (context) => const ChampionSearchPage(),
        AppRoutes.championDetails: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as int;
          return ChampionDetailsPage(championId: args);
        },
        AppRoutes.forgotPassword: (context) => ForgotPasswordPage(),
        AppRoutes.buildItems: (context) => BuildItemsPage(),
      },
    );
  }
}
