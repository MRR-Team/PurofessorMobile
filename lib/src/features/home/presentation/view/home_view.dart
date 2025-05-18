import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/core/constants/app_constatns.dart';
import '../viewmodel/home_viewmodel.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_background.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModel();

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
              child: ElevatedButton(
                onPressed: viewModel.onLoginPressed,
                child: const Text('Zaloguj'),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
