// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get registerTitle => 'Zarejestruj się';

  @override
  String get loginTitle => 'Zaloguj się';

  @override
  String get emailLabel => 'Email';

  @override
  String get nameLabel => 'Nazwa';

  @override
  String get passwordLabel => 'Hasło';

  @override
  String get confirmPasswordLabel => 'Potwierdź hasło';

  @override
  String get registerButton => 'Zarejestruj się';

  @override
  String get alreadyHaveAccount => 'Masz już konto? Zaloguj się.';

  @override
  String get selectLanguage => 'Wybierz język';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get navbarHome => 'Start';

  @override
  String get navbarSettings => 'Ustawienia';

  @override
  String get navbarProfile => 'Profil';

  @override
  String get navbarChampions => 'Championy';

  @override
  String get unknownError => 'Coś poszło nie tak. Spróbuj ponownie.';

  @override
  String get loginSuccess => 'Zalogowano pomyślnie';

  @override
  String get logoutError => 'Wylogowanie nie powiodło się.';

  @override
  String get restPasswordLink => 'Link do zmiany hasła został wysłany na Twoją skrzynkę pocztową.';

  @override
  String get loginSuccessGoogle => 'Zalogowano pomyślnie przez Google.';

  @override
  String get loginGoogleError => 'Wystąpił błąd podczas logowania przez Google. Spróbuj ponownie później.';

  @override
  String get resetPassword => 'Resetuj hasło';

  @override
  String get forgotPasswordEmailInstruction => 'Podaj email, na który wyślemy link do resetu hasła:';

  @override
  String get emailRequiredError => 'Podaj email';

  @override
  String get passwordRequiredError => 'Podaj hasło';

  @override
  String get sendResetLinkButton => 'Wyślij link resetujący';

  @override
  String get forgotPassword => 'Zapomniałeś hasła?';

  @override
  String get loginWithGoogle => 'Zaloguj przez Google';

  @override
  String get nameRequiredError => 'Podaj nazwę';

  @override
  String get passwordsDoNotMatch => 'Hasła nie są takie same';

  @override
  String get noAccount => 'Nie masz konta?';

  @override
  String get logout => 'Wyloguj się';

  @override
  String get logouting => 'Wylogowanie';

  @override
  String get logoutConfirmation => 'Czy na pewno chcesz się wylogować?';

  @override
  String get cancel => 'Anuluj';

  @override
  String get confirmLogout => 'Wyloguj';

  @override
  String get darkMode => 'Ciemny motyw';

  @override
  String get championDetailsTitle => 'Szczegóły championa';

  @override
  String get championLoadError => 'Nie udało się załadować championa.';

  @override
  String get tryAgainButton => 'Spróbuj ponownie';

  @override
  String get championSearchTitle => 'Wybierz championa';

  @override
  String get noResults => 'Brak wyników';

  @override
  String get countersTitle => 'Kontry na';

  @override
  String get noCountersData => 'Brak danych o kontrach.';

  @override
  String get championNameLabel => 'Nazwa championa: ';

  @override
  String get championPositionLabel => 'Pozycja: ';

  @override
  String get championRoleLabel => 'Rola: ';

  @override
  String get championSearchHint => 'Wybierz championa...';

  @override
  String get homeGenerateBuild => 'Wygeneruj build';

  @override
  String get homeServerStatus => 'Status serwera';

  @override
  String get buildItems => 'Build Items';

  @override
  String get yourChampion => 'Twój champion';

  @override
  String get enemyChampion => 'Wrogi champion';

  @override
  String get generateBuild => 'Generuj build';

  @override
  String get selectChampionsToGenerate => 'Wybierz championów i wygeneruj build.';

  @override
  String get failedToFetchBuildItems => 'Nie udało się pobrać build items.';

  @override
  String get noBuildItems => 'Brak build items';

  @override
  String get noLoggedUser => 'Brak zalogowanego użytkownika';

  @override
  String get profileUpdateSuccess => 'Zaktualizowano profil';

  @override
  String get profileUpdateError => 'Błąd aktualizacji profilu';

  @override
  String get editProfile => 'Edytuj profil';

  @override
  String get editProfileNewUsername => 'Nowa nazwa użytkownika';

  @override
  String get editProfileNewPassword => 'Nowe hasło';

  @override
  String get editProfileEmptyFieldsError => 'Uzupełnij przynajmniej jedno pole';

  @override
  String get editProfileSaveChanges => 'Zapisz zmiany';

  @override
  String get userName => 'Nazwa użytkownika';

  @override
  String get serverStatusTitle => 'Status serwera';

  @override
  String get region => 'Region';

  @override
  String get serverName => 'Nazwa serwera';

  @override
  String get maintenances => 'Prace konserwacyjne';

  @override
  String get incidents => 'Incydenty';

  @override
  String get noMaintenances => 'Brak prac konserwacyjnych.';

  @override
  String get noIncidents => 'Brak incydentów.';

  @override
  String get errorFetchingData => 'Błąd podczas pobierania danych.';

  @override
  String get noData => 'Brak danych.';

  @override
  String createdAt(Object date) {
    return 'Utworzono: $date';
  }

  @override
  String get regionName_euw1 => 'Europa Zachodnia';

  @override
  String get regionName_na1 => 'Ameryka Północna';

  @override
  String get regionName_eun1 => 'Europa Północno-Wschodnia';

  @override
  String get regionName_kr => 'Korea';

  @override
  String get regionName_br1 => 'Brazylia';

  @override
  String get regionName_jp1 => 'Japonia';

  @override
  String get regionName_oc1 => 'Oceania';

  @override
  String get regionName_ru => 'Rosja';

  @override
  String get regionName_tr1 => 'Turcja';
}
