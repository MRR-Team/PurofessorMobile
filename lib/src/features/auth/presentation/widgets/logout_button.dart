import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogoutButton extends StatelessWidget {
  final String? label;
  const LogoutButton({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context, listen: false);
    final localizations = AppLocalizations.of(context)!;

    final buttonLabel = label ?? localizations.logout;

    return ElevatedButton.icon(
      icon: const Icon(Icons.logout),
      label: Text(buttonLabel),
      onPressed: () {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text(localizations.logout),
                content: Text(localizations.logoutConfirmation),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(localizations.cancel),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      authController.logout(context);
                    },
                    child: Text(localizations.confirmLogout),
                  ),
                ],
              ),
        );
      },
    );
  }
}
