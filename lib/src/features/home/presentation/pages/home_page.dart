import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/core/constants/app_constatns.dart';
import 'package:purofessor_mobile/src/features/home/presentation/controllers/home_controller.dart';
import 'package:purofessor_mobile/src/features/home/presentation/widgets/home_tile.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_background.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_button_navigation_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewPage = HomePageModel();
    final authController = context.watch<AuthController>();

    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(),
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Text(
                  AppConstants.appName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      if (authController.isLoggedIn)
                        HomeTile(
                          label: 'Wygeneruj build',
                          icon: Icons.search,
                          onTap: () => viewPage.onFindCounterPressed(context),
                        ),
                      HomeTile(
                        label: 'Championy',
                        icon: Icons.person_search,
                        onTap: () => viewPage.onChampionsPressed(context),
                      ),
                      HomeTile(
                        label: 'Status serwera',
                        icon: Icons.cloud_outlined,
                        onTap: () => viewPage.onServerStatusPressed(context),
                      ),
                      HomeTile(
                        label:
                            authController.isLoggedIn
                                ? 'Profil'
                                : 'Zaloguj się',
                        icon:
                            authController.isLoggedIn
                                ? Icons.person
                                : Icons.login,
                        onTap: () {
                          if (authController.isLoggedIn) {
                            viewPage.onProfilePressed(context);
                          } else {
                            viewPage.onLoginPressed(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
