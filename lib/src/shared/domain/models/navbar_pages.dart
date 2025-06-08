import 'package:purofessor_mobile/src/core/routes/app_routes.dart';

enum NavbarPages { home, settings, profile, championSearch }

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

  String get label {
    switch (this) {
      case NavbarPages.home:
        return 'Start';
      case NavbarPages.settings:
        return 'Ustawienia';
      case NavbarPages.profile:
        return 'Profil';
      case NavbarPages.championSearch:
        return 'Championy';
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
