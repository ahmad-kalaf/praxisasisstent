import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:praxisassistent/services/auth_services.dart";
import "package:praxisassistent/utils/constants.dart";
import "package:praxisassistent/widgets/registration_widget.dart";
import "package:provider/provider.dart";

// Dieses Widget ist für die Anmeldung / Login
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late final AuthServices auth;
  // Login-Formular-Zustand
  final _formKey = GlobalKey<FormState>();
  // Controller für E-Mail-Adresse-Eingabefeld
  final _eMailAdressController = TextEditingController();
  // Controller für Passwort-Eingabefeld
  final _passwordController = TextEditingController();
  // Fehlernachricht
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    // aktuellen Benutzer neuladen, um änderungen (z.B. Passwortändern durch Admin über Firebase SDK zu holen)
    auth = context.read<AuthServices>();
    Future.microtask(() async {
      await auth.reloadCurrentUser();
      if (!mounted) return; // Safety check
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // Zugriff auf AuthServices durch Provider
    final auth = context.read<AuthServices>();

    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.loginWidgetTitle)),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Freier Platz zwischen den inneren Widgets
                  spacing: 20.0,
                  children: [
                    Text(AppStrings.welcomeText),
                    // Infotext zur Fehleranzeige, falls es Fehler beim Login gibt
                    Text(_errorMessage, style: TextStyle(color: Colors.red)),
                    // Texteingabefeld für die E-Mail-Adresse
                    TextFormField(
                      decoration: InputDecoration(
                        label: Center(
                          child: Text(AppStrings.txtFormFieldLabelEMail),
                        ),
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
                    // Button zum anmelden / Login
                    ElevatedButton.icon(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await auth.signIn(
                              email: _eMailAdressController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                          } on FirebaseAuthException catch (e) {
                            setState(() {
                              _errorMessage =
                                  e.message ?? 'Unbekannter Fehler beim Login';
                            });
                          }
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
                          MaterialPageRoute(
                            builder: (context) => RegistrationWidget(),
                          ),
                        );
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
