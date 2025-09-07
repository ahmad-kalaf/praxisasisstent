import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:praxisassistent/services/auth_services.dart';
import 'package:praxisassistent/sub_widgets/confirm_password_dialog.dart';
import 'package:praxisassistent/sub_widgets/sign_out_button.dart';
import 'package:praxisassistent/utils/constants.dart';
import 'package:provider/provider.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  // Gibt an, ob der Benutzer authentifiziert ist (z.B. Passwort bestätigt)
  late final AuthServices auth;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.accountSettingsWidgetTitle),
        leading: SignOutButton(),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text(
                  // Infotext
                  AppStrings.accountSettingsInfoText,
                  style: const TextStyle(fontSize: 16),
                ),
                // Zeile für E-Mail
                Row(
                  children: [
                    // Spalte 0
                    Expanded(flex: 1, child: Text('E-Mail')),
                    // Spalte 1
                    Expanded(
                      flex: 2,
                      child: Text(auth.currentUser!.email ?? 'No E-Mail'),
                    ),
                    // Spalte 2
                    IconButton(
                      onPressed: () {
                        final email = auth.currentUser!.email;
                        if (email != null && email.isNotEmpty) {
                          Clipboard.setData(ClipboardData(text: email));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('E-Mail koppiert')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Keine E-Mail vorhanden!')),
                          );
                        }
                      },
                      icon: Icon(Icons.copy),
                    ),
                  ],
                ),
                // Zeile für Passwort
                Row(
                  children: [
                    // Spalte 0
                    Expanded(flex: 1, child: Text('Passwort')),
                    // Spalte 1
                    Expanded(
                      flex: 1,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(
                                'Um das Passwort zurückzusetzen, schreiben Sie eine E-Mail an praxisassistent.com@gmail.com und geben Sie Ihre E-Mail an.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                        label: Text('Passwort zurücksetzen'),
                        icon: Icon(Icons.lock_reset),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
