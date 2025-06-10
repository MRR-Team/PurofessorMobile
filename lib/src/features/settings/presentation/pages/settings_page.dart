import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/widgets/logout_button.dart';
import 'package:purofessor_mobile/src/shared/presentation/controllers/theme_controller.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_background.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_button_navigation_bar.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/change_language.dart';
import 'package:purofessor_mobile/l10n/generated/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(localizations.settingsTitle)),
      bottomNavigationBar: AppBottomNavigationBar(),
      body: AppBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations.darkMode,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Consumer<ThemeController>(
                  builder: (context, controller, _) {
                    final isDark = controller.themeMode == ThemeMode.dark;
                    return Switch(
                      value: isDark,
                      onChanged: (value) {
                        controller.toggleTheme(value);
                      },
                    );
                  },
                ),

                const SizedBox(height: 32),

                const ChangeLanguage(),

                if (context.watch<AuthController>().isLoggedIn) ...[
                  const SizedBox(height: 32),
                  LogoutButton(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
