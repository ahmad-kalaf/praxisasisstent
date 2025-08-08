import 'package:flutter/material.dart';
import 'package:praxisassistent/sub_widgets/confirm_password_dialog.dart';
import 'package:praxisassistent/utils/constants.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  // Gibt an, ob der Benutzer authentifiziert ist (z.B. Passwort bestätigt)
  bool _authenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.accountSettingsWidgetTitle)),
      body: Column(
        spacing: 20.0,
        children: [
          // Info-Text zur Erklärung der Kontoeinstellungen
          Text(AppStrings.accountSettingsInfoText),
          // Zeile mit E-Mail-Adresse
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('E-Mail:'), Text('test@gmail.com')],
          ),
          // Zeile mit Passwort, wird je nach Authentifizierung angezeigt oder verborgen
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Passwort:'),
              // Passwort sichtbar, wenn authentifiziert, sonst Sterne
              Text(_authenticated ? 'Password12345!' : '*****'),
            ],
          ),
          // Zeile mit Button zum Anzeigen/Verbergen des Passworts
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Passwort anzeigen / verbergen'),
              IconButton(
                onPressed: () {
                  if (_authenticated) {
                    // Wenn schon authentifiziert, Passwort ausblenden
                    // und Authentifizierungsstatus zurücksetzen
                    setState(() {
                      _authenticated = false;
                    });
                  } else {
                    // Wenn nicht authentifiziert, Dialog zur Passwortbestätigung zeigen
                    showConfirmPasswordDialog(context).then((value) {
                      if (value) {
                        // Wenn Bestätigung erfolgreich, Passwort anzeigen
                        setState(() {
                          _authenticated = true;
                        });
                      }
                    });
                  }
                },
                // Icon wechselt je nach Authentifizierungsstatus
                icon: Icon(
                  _authenticated ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ],
          ),
          // Zeile mit Button zum Ändern des Passworts
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Passwort ändern'),
              IconButton(
                onPressed: () {
                  if (_authenticated) {
                    // Wenn authentifiziert, weiter zum Passwort ändern (hier nur Snackbar als Platzhalter)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Passwort geändert!')),
                    );
                  } else {
                    // Wenn nicht authentifiziert, erst Passwort bestätigen lassen, dann weiter zum Passwort ändern
                    showConfirmPasswordDialog(context).then((value) {
                      if (value) {
                        setState(() {
                          _authenticated = true;
                        });
                      }
                    });
                  }
                },
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
