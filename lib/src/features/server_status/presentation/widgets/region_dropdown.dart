import 'package:flutter/material.dart';
import 'package:purofessor_mobile/l10n/generated/app_localizations.dart';
import 'package:purofessor_mobile/src/features/server_status/presentation/pages/server_status_page.dart';

class RegionDropdown extends StatelessWidget {
  final String selectedRegion;
  final ValueChanged<String> onChanged;

  const RegionDropdown({
    super.key,
    required this.selectedRegion,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return DropdownButton<String>(
      value: selectedRegion,
      isExpanded: true,
      items:
          ['euw1', 'na1', 'eun1', 'kr', 'br1', 'jp1', 'oc1', 'ru', 'tr1'].map((
            region,
          ) {
            return DropdownMenuItem(
              value: region,
              child: Text(localizations.getTranslatedRegion(region)),
            );
          }).toList(),
      onChanged: (region) {
        if (region != null) onChanged(region);
      },
    );
  }
}
