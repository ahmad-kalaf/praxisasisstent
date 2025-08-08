import "package:flutter/material.dart";
import "package:praxisassistent/utils/constants.dart";
import "package:praxisassistent/widgets/account_settings_screen.dart";
import "package:praxisassistent/widgets/registration_widget.dart";

// Dieses Widget ist für die Anmeldung / Login
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  // Login-Formular-Zustand
  final _formKey = GlobalKey<FormState>();
  // Controller für E-Mail-Adresse-Eingabefeld
  final _eMailAdressController = TextEditingController();
  // Controller für Passwort-Eingabefeld
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.loginWidgetTitle)),
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
            // Button zum anmelden / Login
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountSettingsScreen(),
                    ),
                  );
                }
              },
              label: Text(AppStrings.btnLabelSignIn),
              icon: Icon(Icons.login),
            ),
            Text(AppStrings.noAccountQuestion),
            // Button zum weiterleiten zur Registrierungsseite (RegistrationWidget),
            // Falls User noch kein Konto hat
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationWidget()),
                );
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
