import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/shared/domain/models/navbar_pages.dart';

class NavbarController extends ChangeNotifier {
  NavbarPages _selectedPage = NavbarPages.home;

  NavbarPages get selectedPage => _selectedPage;

  void selectPage(NavbarPages page, BuildContext context) {
    _selectedPage = page;
    notifyListeners();

    Navigator.pushReplacementNamed(context, page.routeName);
  }
}
