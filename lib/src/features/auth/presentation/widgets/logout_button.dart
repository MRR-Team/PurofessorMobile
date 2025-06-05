import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context, listen: false);

    return IconButton(
      icon: const Icon(Icons.logout),
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
