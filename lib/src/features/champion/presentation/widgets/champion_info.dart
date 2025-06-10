import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/features/champion/domain/models/champion_model.dart';
import 'package:purofessor_mobile/src/features/champion/presentation/widgets/champion_avatar.dart';
import 'package:purofessor_mobile/l10n/generated/app_localizations.dart';

class ChampionInfo extends StatelessWidget {
  final ChampionModel champion;

  const ChampionInfo({super.key, required this.champion});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ChampionAvatar(
            photoUrl: champion.photo,
            size: 100,
            radius: 12,
          ),
        ),
        SizedBox(height: 12),
        Text(
          '${localizations.championNameLabel} ${champion.name}',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(height: 8),
        Text(
          '${localizations.championPositionLabel} ${champion.position}',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(height: 8),
        Text(
          '${localizations.championRoleLabel} ${champion.role}',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}
