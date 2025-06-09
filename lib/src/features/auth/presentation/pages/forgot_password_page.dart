import 'package:flutter/material.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_background.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/widgets/forgot_password_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resetuj hasło')),
      body: AppBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: SingleChildScrollView(
                child: ForgotPasswordForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
