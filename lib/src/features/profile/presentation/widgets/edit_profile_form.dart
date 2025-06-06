import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nowa nazwa użytkownika',
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Nowe hasło'),
              obscureText: true,
            ),
            TextFormField(
              controller: confirmController,
              decoration: const InputDecoration(labelText: 'Potwierdź hasło'),
              obscureText: true,
              validator: (value) {
                if (passwordController.text.isNotEmpty &&
                    value != passwordController.text) {
                  return 'Hasła się różnią';
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
                    const SnackBar(
                      content: Text('Uzupełnij przynajmniej jedno pole'),
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
              child: const Text('Zapisz zmiany'),
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
