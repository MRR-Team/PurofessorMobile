import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/widgets/champion_search_bar.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/widgets/position_filter.dart';

class ChampionFilters extends StatelessWidget {
  final TextEditingController searchCtrl;
  final List<String> selectedPositions;
  final void Function(String) onSearchChanged;
  final void Function(String) onTogglePosition;

  const ChampionFilters({
    super.key,
    required this.searchCtrl,
    required this.selectedPositions,
    required this.onSearchChanged,
    required this.onTogglePosition,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChampionSearchBar(controller: searchCtrl, onChanged: onSearchChanged),
        const SizedBox(height: 12),
        PositionFilter(
          options: ['Top', 'Jungle', 'Mid', 'Bot', 'Support'],
          selected: selectedPositions,
          onSelect: onTogglePosition,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
