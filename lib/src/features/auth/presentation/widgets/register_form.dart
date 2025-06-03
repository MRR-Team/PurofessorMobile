import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/core/routes/app_routes.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/button.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';

class RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const RegisterForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
    required this.confirmPasswordController,
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
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Nazwa',
              labelStyle: TextStyle(color: Colors.white70),
              prefixIcon: Icon(Icons.person_outline, color: Colors.white),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Podaj nazwę';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            obscureText: true,
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
          const SizedBox(height: 16),
          TextFormField(
            controller: confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Potwierdź hasło',
              labelStyle: TextStyle(color: Colors.white70),
              prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Powtórz hasło';
              }
              if (value != passwordController.text) {
                return 'Hasła nie są takie same';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),

          Button(
            label: 'Zarejestruj się',
            isLoading: authController.isLoading,
            fullWidth: true,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                authController.register(
                  context,
                  emailController.text,
                  nameController.text,
                  passwordController.text,
                  confirmPasswordController.text,
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
              Navigator.pushNamed(context, AppRoutes.login);
            },
            child: const Text(
              'Masz już konto? Zaloguj się.',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
