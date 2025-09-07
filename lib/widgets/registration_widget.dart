import 'package:flutter/material.dart';
import 'package:praxisassistent/services/auth_services.dart';
import 'package:praxisassistent/utils/constants.dart';
import 'package:provider/provider.dart';

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
  // Fehlernachricht
  final String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    // Zugriff auf AuthServices durch Provider
    final auth = context.read<AuthServices>();

    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.signUpWidgetTitle)),
      body: Form(
        key: _formKey,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Freier Platz zwischen den inneren Widgets
                  spacing: 20.0,
                  children: [
                    Text(AppStrings.welcomeText),
                    // Infotext zur Fehleranzeige, falls es Fehler beim Registrieren gibt
                    Text(_errorMessage, style: TextStyle(color: Colors.red)),
                    // Texteingabefeld für die E-Mail-Adresse
                    TextFormField(
                      decoration: InputDecoration(
                        label: Center(child: Text(AppStrings.txtFormFieldLabelEMail)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.errorInputEMail;
                        }
                        if (!AppStrings.emailRegExp.hasMatch(value)) {
                          return AppStrings.invalidEMail;
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
                        if (!AppStrings.passwordRegExp.hasMatch(value)) {
                          return AppStrings.invalidPassword;
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
                          auth.createUser(
                            email: _eMailAdressController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
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
            ),
          ),
        ),
      ),
    );
  }
}
