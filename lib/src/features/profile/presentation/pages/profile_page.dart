import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purofessor_mobile/src/core/routes/app_routes.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:purofessor_mobile/src/features/auth/presentation/widgets/logout_button.dart';
import 'package:purofessor_mobile/src/features/profile/presentation/controllers/profile_controller.dart';
import 'package:purofessor_mobile/src/features/profile/presentation/widgets/edit_profile_form.dart';
import 'package:purofessor_mobile/src/features/profile/presentation/widgets/profile_info_card.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_background.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/app_button_navigation_bar.dart';
import 'package:purofessor_mobile/src/shared/presentation/widgets/button.dart';
import 'package:purofessor_mobile/l10n/generated/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthController>().user;
    final controller = context.watch<ProfileController>();
    final localizations = AppLocalizations.of(context)!;

    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.home,
            (route) => false,
          );
        }
      });
      return const SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(title: Text(localizations.navbarProfile)),
      bottomNavigationBar: AppBottomNavigationBar(),
      body: AppBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(radius: 40, child: Text(user.name[0].toUpperCase())),
              const SizedBox(height: 16),
              ProfileInfoCard(user: user),
              const SizedBox(height: 16),

              Button(
                label:
                    controller.isEditing
                        ? localizations.cancel
                        : localizations.editProfile,
                icon: controller.isEditing ? Icons.close : Icons.edit,
                onPressed: controller.toggleEdit,
              ),

              const SizedBox(height: 16),
              if (controller.isEditing)
                EditProfileForm(
                  onSave: ({String? name, String? password}) {
                    controller.updateProfile(
                      context: context,
                      name: name,
                      password: password,
                    );
                  },
                ),
              const SizedBox(height: 32),

              LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
