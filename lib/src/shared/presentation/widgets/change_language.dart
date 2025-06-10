import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/shared/presentation/controllers/localization_controller.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final localizationController = Provider.of<LocalizationController>(context);

    localizationController.loadLocale();

    final locale = localizationController.locale;
    final languages = localizationController.languages;

    final selectedLanguage = languages.firstWhere(
      (lang) => lang.$2 == locale.languageCode,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            localizations.selectLanguage,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),

          textColor: Colors.black,
          onTap: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<(String, String)>(
            isExpanded: true,
            value: selectedLanguage,
            items:
                languages.map((lang) {
                  return DropdownMenuItem<(String, String)>(
                    value: lang,
                    child: Text(lang.$1),
                  );
                }).toList(),
            onChanged: (language) {
              if (language == null) {
                return;
              }
              localizationController.setLocale(language.$2);
            },
          ),
        ),
      ],
    );
  }
}
