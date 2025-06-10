import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfileForm extends StatefulWidget {
  final void Function({String? name, String? password}) onSave;

  const EditProfileForm({super.key, required this.onSave});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: localizations.editProfileNewUsername,
                labelStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.person_outline, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: localizations.editProfileNewPassword,
                labelStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: confirmController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: localizations.confirmPasswordLabel,
                labelStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
              ),
              obscureText: true,
              validator: (value) {
                if (passwordController.text.isNotEmpty &&
                    value != passwordController.text) {
                  return localizations.passwordsDoNotMatch;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final password = passwordController.text.trim();

                if (name.isEmpty && password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(localizations.editProfileEmptyFieldsError),
                    ),
                  );
                  return;
                }

                if (!_formKey.currentState!.validate()) return;

                widget.onSave(
                  name: name.isNotEmpty ? name : null,
                  password: password.isNotEmpty ? password : null,
                );
              },
              child: Text(localizations.editProfileSaveChanges),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }
}
