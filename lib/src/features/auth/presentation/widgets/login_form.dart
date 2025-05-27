import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/button.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white70),
              prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Podaj email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: passwordController,
            obscureText: true,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Hasło',
              labelStyle: TextStyle(color: Colors.white70),
              prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Podaj hasło';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),

          Button(
            label: 'Zaloguj się',
            isLoading: authController.isLoading,
            fullWidth: true,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                authController.login(
                  context,
                  emailController.text,
                  passwordController.text,
                );
              }
            },
          ),

          const SizedBox(height: 16),

          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/guest');
            },
            child: const Text(
              'Wejdź jako gość',
              style: TextStyle(color: Colors.white70),
            ),
          ),

          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text.rich(
              TextSpan(
                text: 'Nie masz konta? ',
                style: TextStyle(color: Colors.white70),
                children: [
                  TextSpan(
                    text: 'Zarejestruj się',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
