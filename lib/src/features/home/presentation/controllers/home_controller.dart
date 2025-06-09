import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/core/routes/app_routes.dart';

class HomePageModel {
  void onLoginPressed(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.login);
  }

  void onProfilePressed(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profile);
  }

  void onChampionsPressed(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.championSearch);
  }

  void onFindCounterPressed(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.championSearch);
  }

  void onServerStatusPressed(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settings);
  }
}
