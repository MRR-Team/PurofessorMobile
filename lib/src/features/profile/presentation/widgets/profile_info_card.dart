import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/shared/domain/models/user_model.dart';
import 'package:purofessor_mobile/l10n/generated/app_localizations.dart';

class ProfileInfoCard extends StatelessWidget {
  final User user;

  const ProfileInfoCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${localizations.userName} ${user.name}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('Email: ${user.email}'),
          ],
        ),
      ),
    );
  }
}
