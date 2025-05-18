import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/core/constants/app_constatns.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/button.dart';
import '../controllers/home_controller.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewPage = HomePageModel();

    return Scaffold(
      body: AppBackground(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: Text(
                  AppConstants.appName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const Spacer(),

            Center(
              child: Button(
                label: 'Przejdz do logowania',
                onPressed: () => viewPage.onLoginPressed(context),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
