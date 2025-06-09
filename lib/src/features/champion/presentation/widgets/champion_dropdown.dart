import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/features/champion/domain/models/champion_model.dart';
import 'champion_avatar.dart';

typedef ChampionChanged = void Function(ChampionModel?);

class ChampionDropdown extends StatelessWidget {
  final List<ChampionModel> champions;
  final ChampionModel? selectedChampion;
  final ChampionChanged onChanged;
  final String label;

  const ChampionDropdown({
    super.key,
    required this.champions,
    required this.selectedChampion,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ChampionModel>(
      value: selectedChampion,
      items:
          champions.map((champion) {
            return DropdownMenuItem(
              value: champion,
              child: Row(
                children: [
                  ChampionAvatar(
                    photoUrl: champion.photo,
                    size: 32,
                    radius: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(champion.name),
                ],
              ),
            );
          }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
