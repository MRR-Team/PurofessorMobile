import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/core/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum NavbarPages { home, championSearch, profile, settings }

extension NavbarPagesExtension on NavbarPages {
  String get routeName {
    switch (this) {
      case NavbarPages.home:
        return AppRoutes.home;
      case NavbarPages.settings:
        return AppRoutes.settings;
      case NavbarPages.profile:
        return AppRoutes.profile;
      case NavbarPages.championSearch:
        return AppRoutes.championSearch;
    }
  }

  String label(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    switch (this) {
      case NavbarPages.home:
        return localization.navbarHome;
      case NavbarPages.settings:
        return localization.navbarSettings;
      case NavbarPages.profile:
        return localization.navbarProfile;
      case NavbarPages.championSearch:
        return localization.navbarChampions;
    }
  }

  bool get requiresAuth {
    switch (this) {
      case NavbarPages.home:
      case NavbarPages.settings:
        return false;
      case NavbarPages.profile:
      case NavbarPages.championSearch:
        return true;
    }
  }
}
