import 'package:flutter/material.dart';

// Farben
final Color kAppBarBackgroundColor = Colors.grey[600]!;
final Color kScaffoldGradientStartColor = Colors.grey[800]!;
final Color kScaffoldGradientEndColor = Colors.grey[400]!;
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
  static const String loginLabel = 'Praxisassistent';
  static const String welcomeText = 'Willkommen zum praxisassistent!';
  static const String noAccountQuestion = 'Noch kein Konto?';
  static const String txtFormFieldLabelEMail = 'E-Mail';
  static const String txtFormFieldLabelPassword = 'Passwort';
  static const String errorInputEMail = 'Bitte E-Mail-Adresse eingeben!';
  static const String errorInputPassword = 'Bitte Passwort eingeben!';
  static const String btnLabelSignIn = 'Anmelden';
  static const String btnLabelSignUp = 'Registrieren';
}
