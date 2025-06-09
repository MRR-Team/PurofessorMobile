import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/features/champion/domain/models/champion_model.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/controllers/champion_controller.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/widgets/champion_dropdown.dart';
import 'package:purofessor_mobile/src/features/item_build/presentation/controllers/build_items_controller.dart';
import 'package:purofessor_mobile/src/features/item_build/presentation/widgets/build_items_list.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_background.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_button_navigation_bar.dart';

class BuildItemsPage extends StatefulWidget {
  const BuildItemsPage({super.key});

  @override
  State<BuildItemsPage> createState() => _BuildItemsPageState();
}

class _BuildItemsPageState extends State<BuildItemsPage> {
  ChampionModel? _selectedChampion;
  ChampionModel? _selectedEnemyChampion;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChampionController>().fetchChampions(context);
    });
  }

  Future<void> _generateBuild() async {
    if (_selectedChampion == null || _selectedEnemyChampion == null) return;

    setState(() {
      _isLoading = true;
    });

    final buildItemsController = context.read<BuildItemsController>();

    await buildItemsController.loadBuildItems(
      _selectedEnemyChampion!.id,
      _selectedChampion!.id,
    );

    if (!mounted) return;

    if (buildItemsController.state == BuildItemsState.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(buildItemsController.errorMessage ?? 'Nie udało się pobrać build items.'),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final championController = context.watch<ChampionController>();
    final buildItemsController = context.watch<BuildItemsController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Build Items')),
      bottomNavigationBar: AppBottomNavigationBar(),
      body: AppBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ChampionDropdown(
                champions: championController.champions,
                selectedChampion: _selectedChampion,
                onChanged: (value) => setState(() => _selectedChampion = value),
                label: 'Twój champion',
              ),
              const SizedBox(height: 16),
              ChampionDropdown(
                champions: championController.champions,
                selectedChampion: _selectedEnemyChampion,
                onChanged: (value) => setState(() => _selectedEnemyChampion = value),
                label: 'Wrogi champion',
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _generateBuild,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Generuj build'),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: _buildBody(buildItemsController),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildItemsController buildItemsController) {
    switch (buildItemsController.state) {
      case BuildItemsState.initial:
        return const Center(child: Text('Wybierz championów i wygeneruj build.'));
      case BuildItemsState.loading:
        return const Center(child: CircularProgressIndicator());
      case BuildItemsState.loaded:
        return BuildItemsList(items: buildItemsController.items);
      case BuildItemsState.error:
        return Center(
          child: Text(buildItemsController.errorMessage ?? 'Wystąpił błąd.'),
        );
    }
  }
}
