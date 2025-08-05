import "package:flutter/material.dart";

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final _eMailAdressController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Login")),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.0,
          children: [
            Text("Willkommen zum praxisassistent!"),
            TextFormField(
              decoration: InputDecoration(
                label: Center(child: Text('E-Mail-Adresse')),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte E-Mail-Adresse eingeben!';
                }
                return null;
              },
              controller: _eMailAdressController,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Center(child: Text('Passwort')),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte Passwort eingeben!';
                }
                return null;
              },
              controller: _passwordController,
            ),
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // login
                }
              },
              label: Text("LOGIN"),
              icon: Icon(Icons.login),
            ),
            Text('Noch kein Konto?'),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text('Registrieren'),
              icon: Icon(Icons.person_add),
            ),
          ],
        ),
      ),
    );
  }
}
