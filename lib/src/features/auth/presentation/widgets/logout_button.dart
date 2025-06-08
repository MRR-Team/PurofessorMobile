import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';

class LogoutButton extends StatelessWidget {
  final String label;
  const LogoutButton({super.key, this.label = 'Wyloguj się'});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context, listen: false);

    return ElevatedButton.icon(
      icon: const Icon(Icons.logout),
      label: Text(label),
      onPressed: () {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Wylogowanie'),
                content: const Text('Czy na pewno chcesz się wylogować?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Anuluj'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      authController.logout(context);
                    },
                    child: const Text('Wyloguj'),
                  ),
                ],
              ),
        );
      },
    );
  }
}
