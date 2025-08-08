import 'package:flutter/material.dart';

// Farben
final Color kAppBarBackgroundColor = Colors.grey[600]!;
final Color kDefaultBodyBackgroundColor = Colors.grey;
final Color kDefaultTextColor = Colors.white;
final Color kButtonBackgroundColor = Colors.grey[600]!;
// Schriftgrößen
final double kDefaultAppBarFontSize = 24.0;
final double kDefaultBodyFontSize = 18.0;

// Buttons
const double kButtonElevation = 20;

// Strings
class AppStrings {
  static const String materialAppTitle = 'Praxisassistent';
  static const String accountSettingsWidgetTitle = 'Kontoeinstellungen';
  static const String loginWidgetTitle = 'Anmeldung';
  static const String signUpWidgetTitle = 'Registrierung';

  static const String welcomeText = 'Willkommen zum praxisassistent!';
  static const String noAccountQuestion = 'Noch kein Konto?';
  static const String txtFormFieldLabelEMail = 'E-Mail';
  static const String txtFormFieldLabelPassword = 'Passwort';
  static const String errorInputEMail = 'Bitte E-Mail-Adresse eingeben!';
  static const String errorInputPassword = 'Bitte Passwort eingeben!';
  static const String btnLabelSignIn = 'Anmelden';
  static const String btnLabelSignUp = 'Registrieren';

  static const String txtFormFieldLabelConfirmPassword = 'Passwort wiederholen';

  static const String errorInputConfirmPassword = 'Bitte Passwort wiederholen!';

  static const String errorPasswordMismatch =
      'Passwörter stimmen nicht überein!';
  static const String errorPasswordIncorrect = 'Passwort ist falsch!';

  static const String accountSettingsInfoText =
      'Hier können Sie Ihre Kontoeinstellungen verwalten.';
}
