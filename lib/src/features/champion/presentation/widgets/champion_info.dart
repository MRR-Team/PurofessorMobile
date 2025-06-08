import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/features/champion/domain/models/champion_model.dart';

class ChampionInfo extends StatelessWidget {
  final ChampionModel champion;

  const ChampionInfo({super.key, required this.champion});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nazwa championa: ${champion.name}',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Pozycja: ${champion.position}',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Rola: ${champion.role}',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}
