import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/core/constants/app_constatns.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/widgets/logout_button.dart';
import 'package:purofessor_mobile/src/features/home/presentation/controllers/home_controller.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/button.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_background.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_button_navigation_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewPage = HomePageModel();

    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(),
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                AppConstants.appName,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              if (context.watch<AuthController>().isLoggedIn)
                const LogoutButton()
              else
                Button(
                  label: 'Przejdź do logowania',
                  onPressed: () => viewPage.onLoginPressed(context),
                ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
