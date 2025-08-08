import 'package:flutter/material.dart';
import 'package:praxisassistent/utils/constants.dart';

Future<bool> showConfirmPasswordDialog(BuildContext context) async {
  bool authenticated = false;
  final TextEditingController passwordController = TextEditingController();

  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: kDefaultBodyBackgroundColor,
      title: Text('Passwort anzeigen'),
      content: Text('Geben Sie das Passwort ein um sich zu authentifizieren.'),
      actions: [
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: AppStrings.txtFormFieldLabelPassword,
          ),
          controller: passwordController,
        ),
        TextButton(
          onPressed: () {
            // Hier muss geprüft werden, ob das Passwort korrekt ist
            if (passwordController.text == 'Password12345!') {
              authenticated = true;

              passwordController.clear();
              Navigator.of(context).pop();
            } else if (passwordController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppStrings.errorInputPassword)),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppStrings.errorPasswordIncorrect)),
              );
            }
          },
          child: Text('Anzeigen'),
        ),
        TextButton(
          onPressed: () {
            passwordController.clear();
            Navigator.of(context).pop();
          },
          child: Text('Abbrechen'),
        ),
      ],
    ),
  );
  return authenticated;
}
