import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl')
  ];

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerTitle;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordLabel;

  /// No description provided for @registerButton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerButton;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Login'**
  String get alreadyHaveAccount;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get selectLanguage;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @navbarHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navbarHome;

  /// No description provided for @navbarSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navbarSettings;

  /// No description provided for @navbarProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navbarProfile;

  /// No description provided for @navbarChampions.
  ///
  /// In en, this message translates to:
  /// **'Champions'**
  String get navbarChampions;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Try again.'**
  String get unknownError;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Logged in successfully'**
  String get loginSuccess;

  /// No description provided for @logoutError.
  ///
  /// In en, this message translates to:
  /// **'Logout failed.'**
  String get logoutError;

  /// No description provided for @restPasswordLink.
  ///
  /// In en, this message translates to:
  /// **'Password reset link has been sent to your email.'**
  String get restPasswordLink;

  /// No description provided for @loginSuccessGoogle.
  ///
  /// In en, this message translates to:
  /// **'Logged in successfully by Google.'**
  String get loginSuccessGoogle;

  /// No description provided for @loginGoogleError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while logging in by Google. Please try again later.'**
  String get loginGoogleError;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @forgotPasswordEmailInstruction.
  ///
  /// In en, this message translates to:
  /// **'Enter the email address where we will send the password reset link:'**
  String get forgotPasswordEmailInstruction;

  /// No description provided for @emailRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get emailRequiredError;

  /// No description provided for @passwordRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get passwordRequiredError;

  /// No description provided for @sendResetLinkButton.
  ///
  /// In en, this message translates to:
  /// **'Send reset link'**
  String get sendResetLinkButton;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @loginWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get loginWithGoogle;

  /// No description provided for @nameRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get nameRequiredError;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get noAccount;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @logouting.
  ///
  /// In en, this message translates to:
  /// **'Logging out'**
  String get logouting;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmation;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get confirmLogout;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkMode;

  /// No description provided for @championDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Champion Details'**
  String get championDetailsTitle;

  /// No description provided for @championLoadError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load champion.'**
  String get championLoadError;

  /// No description provided for @tryAgainButton.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgainButton;

  /// No description provided for @championSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Select a champion'**
  String get championSearchTitle;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get noResults;

  /// No description provided for @countersTitle.
  ///
  /// In en, this message translates to:
  /// **'Counters on'**
  String get countersTitle;

  /// No description provided for @noCountersData.
  ///
  /// In en, this message translates to:
  /// **'No counter data available.'**
  String get noCountersData;

  /// No description provided for @championNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Champion Name: '**
  String get championNameLabel;

  /// No description provided for @championPositionLabel.
  ///
  /// In en, this message translates to:
  /// **'Position: '**
  String get championPositionLabel;

  /// No description provided for @championRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'Role: '**
  String get championRoleLabel;

  /// No description provided for @championSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Select a champion...'**
  String get championSearchHint;

  /// No description provided for @homeGenerateBuild.
  ///
  /// In en, this message translates to:
  /// **'Generate Build'**
  String get homeGenerateBuild;

  /// No description provided for @homeServerStatus.
  ///
  /// In en, this message translates to:
  /// **'Server Status'**
  String get homeServerStatus;

  /// No description provided for @buildItems.
  ///
  /// In en, this message translates to:
  /// **'Build Items'**
  String get buildItems;

  /// No description provided for @yourChampion.
  ///
  /// In en, this message translates to:
  /// **'Your Champion'**
  String get yourChampion;

  /// No description provided for @enemyChampion.
  ///
  /// In en, this message translates to:
  /// **'Enemy Champion'**
  String get enemyChampion;

  /// No description provided for @generateBuild.
  ///
  /// In en, this message translates to:
  /// **'Generate Build'**
  String get generateBuild;

  /// No description provided for @selectChampionsToGenerate.
  ///
  /// In en, this message translates to:
  /// **'Select champions and generate a build.'**
  String get selectChampionsToGenerate;

  /// No description provided for @failedToFetchBuildItems.
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch build items.'**
  String get failedToFetchBuildItems;

  /// No description provided for @noBuildItems.
  ///
  /// In en, this message translates to:
  /// **'No build items'**
  String get noBuildItems;

  /// No description provided for @noLoggedUser.
  ///
  /// In en, this message translates to:
  /// **'No logged user'**
  String get noLoggedUser;

  /// No description provided for @profileUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdateSuccess;

  /// No description provided for @profileUpdateError.
  ///
  /// In en, this message translates to:
  /// **'Error updating profile'**
  String get profileUpdateError;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @editProfileNewUsername.
  ///
  /// In en, this message translates to:
  /// **'New Username'**
  String get editProfileNewUsername;

  /// No description provided for @editProfileNewPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get editProfileNewPassword;

  /// No description provided for @editProfileEmptyFieldsError.
  ///
  /// In en, this message translates to:
  /// **'Please fill in at least one field'**
  String get editProfileEmptyFieldsError;

  /// No description provided for @editProfileSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get editProfileSaveChanges;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get userName;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pl': return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
