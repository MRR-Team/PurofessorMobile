
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/controllers/champion_controller.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/widgets/champion_filters.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/widgets/champion_list_item.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_background.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_button_navigation_bar.dart';

class ChampionSearchPage extends StatefulWidget {
  const ChampionSearchPage({super.key});

  @override
  State<ChampionSearchPage> createState() => _ChampionSearchPageState();
}

class _ChampionSearchPageState extends State<ChampionSearchPage> {
  final searchCtrl = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showFilters = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChampionController>().fetchChampions(context);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<ChampionController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Wybierz championa',)),
      bottomNavigationBar: const AppBottomNavigationBar(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is UserScrollNotification) {
            if (scrollNotification.direction == ScrollDirection.reverse && _showFilters) {
              setState(() => _showFilters = false);
            } else if (scrollNotification.direction == ScrollDirection.forward && !_showFilters) {
              setState(() => _showFilters = true);
            }
          } else if (scrollNotification is ScrollEndNotification && !_showFilters) {
            setState(() => _showFilters = true);
          }
          return true;
        },
        child: AppBackground(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _showFilters
                      ? ChampionFilters(
                    searchCtrl: searchCtrl,
                    selectedPositions: ctrl.selectedPositions,
                    onSearchChanged: ctrl.updateQuery,
                    onTogglePosition: ctrl.togglePosition,
                  )
                      : const SizedBox.shrink(),
                ),
                Expanded(
                  child: ctrl.filteredChampions.isEmpty
                      ? Center(
                    child: Text(
                      'Brak wyników',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )
                      : ListView.separated(
                    controller: _scrollController,
                    itemCount: ctrl.filteredChampions.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (_, i) {
                      final c = ctrl.filteredChampions[i];
                      return ChampionListItem(champion: c);
                    },
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
