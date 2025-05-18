import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/pages/login_page.dart';

class HomePageModel {
  void onLoginPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }
}
