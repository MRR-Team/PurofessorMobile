// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get registerTitle => 'Register';

  @override
  String get loginTitle => 'Login';

  @override
  String get emailLabel => 'Email';

  @override
  String get nameLabel => 'Name';

  @override
  String get passwordLabel => 'Password';

  @override
  String get confirmPasswordLabel => 'Confirm Password';

  @override
  String get registerButton => 'Register';

  @override
  String get alreadyHaveAccount => 'Already have an account? Login';

  @override
  String get selectLanguage => 'Select language';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get navbarHome => 'Home';

  @override
  String get navbarSettings => 'Settings';

  @override
  String get navbarProfile => 'Profile';

  @override
  String get navbarChampions => 'Champions';

  @override
  String get unknownError => 'Something went wrong. Try again.';

  @override
  String get loginSuccess => 'Logged in successfully';

  @override
  String get logoutError => 'Logout failed.';

  @override
  String get restPasswordLink => 'Password reset link has been sent to your email.';

  @override
  String get loginSuccessGoogle => 'Logged in successfully by Google.';

  @override
  String get loginGoogleError => 'An error occurred while logging in by Google. Please try again later.';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get forgotPasswordEmailInstruction => 'Enter the email address where we will send the password reset link:';

  @override
  String get emailRequiredError => 'Please enter your email';

  @override
  String get passwordRequiredError => 'Please enter your password';

  @override
  String get sendResetLinkButton => 'Send reset link';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get loginWithGoogle => 'Login with Google';

  @override
  String get nameRequiredError => 'Please enter your name';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get noAccount => 'Don\'t have an account?';

  @override
  String get logout => 'Log out';

  @override
  String get logouting => 'Logging out';

  @override
  String get logoutConfirmation => 'Are you sure you want to log out?';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirmLogout => 'Log out';

  @override
  String get darkMode => 'Dark mode';

  @override
  String get championDetailsTitle => 'Champion Details';

  @override
  String get championLoadError => 'Failed to load champion.';

  @override
  String get tryAgainButton => 'Try Again';

  @override
  String get championSearchTitle => 'Select a champion';

  @override
  String get noResults => 'No results';

  @override
  String get countersTitle => 'Counters on';

  @override
  String get noCountersData => 'No counter data available.';

  @override
  String get championNameLabel => 'Champion Name: ';

  @override
  String get championPositionLabel => 'Position: ';

  @override
  String get championRoleLabel => 'Role: ';

  @override
  String get championSearchHint => 'Select a champion...';

  @override
  String get homeGenerateBuild => 'Generate Build';

  @override
  String get homeServerStatus => 'Server Status';

  @override
  String get buildItems => 'Build Items';

  @override
  String get yourChampion => 'Your Champion';

  @override
  String get enemyChampion => 'Enemy Champion';

  @override
  String get generateBuild => 'Generate Build';

  @override
  String get selectChampionsToGenerate => 'Select champions and generate a build.';

  @override
  String get failedToFetchBuildItems => 'Failed to fetch build items.';

  @override
  String get noBuildItems => 'No build items';

  @override
  String get noLoggedUser => 'No logged user';

  @override
  String get profileUpdateSuccess => 'Profile updated successfully';

  @override
  String get profileUpdateError => 'Error updating profile';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get editProfileNewUsername => 'New Username';

  @override
  String get editProfileNewPassword => 'New Password';

  @override
  String get editProfileEmptyFieldsError => 'Please fill in at least one field';

  @override
  String get editProfileSaveChanges => 'Save Changes';

  @override
  String get userName => 'User Name';

  @override
  String get serverStatusTitle => 'Server Status';

  @override
  String get region => 'Region';

  @override
  String get serverName => 'Server Name';

  @override
  String get maintenances => 'Maintenances';

  @override
  String get incidents => 'Incidents';

  @override
  String get noMaintenances => 'No maintenances.';

  @override
  String get noIncidents => 'No incidents.';

  @override
  String get errorFetchingData => 'Error while fetching data.';

  @override
  String get noData => 'No data.';

  @override
  String createdAt(Object date) {
    return 'Created at: $date';
  }

  @override
  String get regionName_euw1 => 'Western Europe';

  @override
  String get regionName_na1 => 'North America';

  @override
  String get regionName_eun1 => 'Northern & Eastern Europe';

  @override
  String get regionName_kr => 'Korea';

  @override
  String get regionName_br1 => 'Brazil';

  @override
  String get regionName_jp1 => 'Japan';

  @override
  String get regionName_oc1 => 'Oceania';

  @override
  String get regionName_ru => 'Russia';

  @override
  String get regionName_tr1 => 'Turkey';
}
