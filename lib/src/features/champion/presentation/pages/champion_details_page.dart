import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/controllers/champion_controller.dart';
import 'package:purofessor_mobile/src/features/champion/domain/models/champion_model.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_background.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_button_navigation_bar.dart';

class ChampionDetailsPage extends StatelessWidget {
  final int championId;

  const ChampionDetailsPage({super.key, required this.championId});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ChampionController>();

    return FutureBuilder<ChampionModel>(
      future: controller.fetchChampionDetails(championId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return const Scaffold(
            body: Center(child: Text('Nie udało się załadować championa')),
          );
        }

        final champion = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: Text(champion.name)),
          bottomNavigationBar: const AppBottomNavigationBar(),
          body: AppBackground(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nazwa championa: ${champion.name}', style: const TextStyle(color: Colors.white, fontSize: 18)),
                  const SizedBox(height: 8),
                  Text('Pozycja: ${champion.position}', style: const TextStyle(color: Colors.white, fontSize: 18)),
                  const SizedBox(height: 8),
                  Text('Rola: ${champion.role}', style: const TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
