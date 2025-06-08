import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:purofessor_mobile/src/shared/domain/models/navbar_pages.dart';
import 'package:purofessor_mobile/src/shared/presentation/controllers/navbar_controller.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navbarController = Provider.of<NavbarController>(context);
    final authController = Provider.of<AuthController>(context);

    final availablePages =
        NavbarPages.values.where((page) {
          if (!page.requiresAuth) return true;
          return authController.isLoggedIn;
        }).toList();

    final currentIndex = availablePages.indexOf(navbarController.selectedPage);
    final safeIndex = currentIndex >= 0 ? currentIndex : 0;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: safeIndex,
      onTap: (index) {
        final selected = availablePages[index];
        navbarController.selectPage(selected, context);
      },
      items:
          availablePages.map((page) {
            return BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: page.label,
            );
          }).toList(),
    );
  }
}
