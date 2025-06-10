import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/features/item_build/domain/models/build_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildItemsList extends StatelessWidget {
  final List<BuildItem> items;

  const BuildItemsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    if (items.isEmpty) {
      return Center(child: Text(localizations.noBuildItems));
    }

    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.photo,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/item_placeholder.png',
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
