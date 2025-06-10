import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/features/champion/domain/models/champion_model.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/controllers/champion_controller.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/widgets/champion_counters.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/widgets/champion_info.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_background.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_button_navigation_bar.dart';
import 'package:purofessor_mobile/l10n/generated/app_localizations.dart';

class ChampionDetailsPage extends StatelessWidget {
  final int championId;

  const ChampionDetailsPage({super.key, required this.championId});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ChampionController>();
    final localizations = AppLocalizations.of(context)!;

    return FutureBuilder<ChampionModel>(
      future: controller.fetchChampionDetails(championId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(title: Text(localizations.championDetailsTitle)),
            bottomNavigationBar: const AppBottomNavigationBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localizations.championLoadError,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.refresh),
                    label: Text(localizations.tryAgainButton),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
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
                  ChampionInfo(champion: champion),
                  ChampionCounters(champion: champion),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
