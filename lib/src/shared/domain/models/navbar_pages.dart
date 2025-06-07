enum NavbarPages { home, settings, profile }

extension NavbarPagesExtension on NavbarPages {
  String get routeName {
    switch (this) {
      case NavbarPages.home:
        return '/home';
      case NavbarPages.settings:
        return '/settings';
      case NavbarPages.profile:
        return '/profile';
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
    }
  }

  bool get requiresAuth {
    switch (this) {
      case NavbarPages.home:
      case NavbarPages.settings:
        return false;
      case NavbarPages.profile:
        return true;
    }
  }
}
