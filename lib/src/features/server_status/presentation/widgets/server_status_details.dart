import 'package:flutter/material.dart';
import 'package:purofessor_mobile/l10n/generated/app_localizations.dart';

class ServerStatusDetails extends StatelessWidget {
  final dynamic status;

  const ServerStatusDetails({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return ListView(
      children: [
        Text(
          '${localizations.region}: ${status.region.toUpperCase()}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Text(
          '${localizations.serverName}: ${status.name}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Text(
          '🛠️ ${localizations.maintenances}:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        if (status.maintenances.isEmpty)
          Text(localizations.noMaintenances)
        else
          ...status.maintenances.map(
            (m) => Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text('ID: ${m['id']}'),
                subtitle: Text(localizations.createdAt(m['created_at'])),
              ),
            ),
          ),
        const SizedBox(height: 20),
        Text(
          '🚨 ${localizations.incidents}:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        if (status.incidents.isEmpty)
          Text(localizations.noIncidents)
        else
          ...status.incidents.map(
            (i) => Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text('ID: ${i['id']}'),
                subtitle: Text(localizations.createdAt(i['created_at'])),
              ),
            ),
          ),
      ],
    );
  }
}
