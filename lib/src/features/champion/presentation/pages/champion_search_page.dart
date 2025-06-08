import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/controllers/champion_controller.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/widgets/champion_search_bar.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/widgets/position_filter.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_background.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_button_navigation_bar.dart';

class ChampionSearchPage extends StatefulWidget {
  const ChampionSearchPage({super.key});
  @override
  State<ChampionSearchPage> createState() => _ChampionSearchPageState();
}

class _ChampionSearchPageState extends State<ChampionSearchPage> {
  final searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChampionController>().fetchChampions(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<ChampionController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Wybierz championa')),
      bottomNavigationBar: const AppBottomNavigationBar(),
      body: AppBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ChampionSearchBar(
                controller: searchCtrl,
                onChanged: ctrl.updateQuery,
              ),
              const SizedBox(height: 12),
              PositionFilter(
                options: ['Top', 'Jungle', 'Mid', 'Bot', 'Support'],
                selected: ctrl.selectedPositions,
                onSelect: ctrl.togglePosition,
              ),
              const SizedBox(height: 20),
              Expanded(
                child:
                    ctrl.champions.isEmpty
                        ? const Center(
                          child: Text(
                            'Brak wyników',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                        : ListView.builder(
                          itemCount: ctrl.filteredChampions.length,
                          itemBuilder: (_, i) {
                            final c = ctrl.filteredChampions[i];
                            return ListTile(
                              title: Text(
                                c.name,
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                c.position,
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () {},
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
