import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/core/routes/app_routes.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/button.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:purofessor_mobile/l10n/generated/app_localizations.dart';

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
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: localizations.emailLabel,
              labelStyle: TextStyle(color: Colors.white70),
              prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localizations.emailRequiredError;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Button(
              label: localizations.forgotPassword,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.forgotPassword);
              },
              fullWidth: false,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: localizations.passwordLabel,
              labelStyle: TextStyle(color: Colors.white70),
              prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localizations.passwordRequiredError;
              }
              return null;
            },
          ),
          const SizedBox(height: 24),

          Button(
            label: localizations.loginTitle,
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

          const SizedBox(height: 32),

          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text.rich(
              TextSpan(
                text: localizations.noAccount,
                style: TextStyle(color: Colors.white70),
                children: [
                  TextSpan(
                    text: localizations.registerButton,
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

          ElevatedButton.icon(
            onPressed: () {
              context.read<AuthController>().loginWithGoogle(context);
            },
            icon: const Icon(Icons.login),
            label: Text(localizations.loginWithGoogle),
          ),
        ],
      ),
    );
  }
}
