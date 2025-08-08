import 'package:flutter/material.dart';
import 'package:praxisassistent/utils/constants.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({super.key});

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  // Registrierung-Formular-Zustand
  final _formKey = GlobalKey<FormState>();
  // Controller für E-Mail-Adresse-Eingabefeld
  final _eMailAdressController = TextEditingController();
  // Controller für Passwort-Eingabefeld
  final _passwordController = TextEditingController();
  // Controller für Passwort-Bestätigungs-Eingabefeld
  final _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.signUpWidgetTitle)),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Freier Platz zwischen den inneren Widgets
          spacing: 20.0,
          children: [
            Text(AppStrings.welcomeText),
            // Texteingabefeld für die E-Mail-Adresse
            TextFormField(
              decoration: InputDecoration(
                label: Center(child: Text(AppStrings.txtFormFieldLabelEMail)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.errorInputEMail;
                }
                return null;
              },
              controller: _eMailAdressController,
            ),
            // Texteingabefeld für das Passwort
            TextFormField(
              decoration: InputDecoration(
                label: Center(
                  child: Text(AppStrings.txtFormFieldLabelPassword),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.errorInputPassword;
                }
                return null;
              },
              controller: _passwordController,
            ),
            // Texteingabefeld für die Passwort-Bestätigung
            TextFormField(
              decoration: InputDecoration(
                label: Center(
                  child: Text(AppStrings.txtFormFieldLabelConfirmPassword),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.errorInputConfirmPassword;
                }
                if (value != _passwordController.text) {
                  return AppStrings.errorPasswordMismatch;
                }
                return null;
              },
              controller: _confirmPasswordController,
            ),
            // Button zum registrieren / Konto erstellen
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Logik für Kontoerstellen
                }
                // Zurück zur Login-Seite (wird später innerhalb der if-Bedingung sein)
                Navigator.pop(context);
              },
              label: Text(AppStrings.btnLabelSignUp),
              icon: Icon(Icons.person_add),
            ),
          ],
        ),
      ),
    );
  }
}
