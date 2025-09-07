import 'package:flutter/material.dart';
import 'package:praxisassistent/services/auth_services.dart';
import 'package:praxisassistent/sub_widgets/sign_out_button.dart';
import 'package:provider/provider.dart';

class VerifyEmailWidget extends StatefulWidget {
  const VerifyEmailWidget({super.key});

  @override
  State<VerifyEmailWidget> createState() => _VerifyEmailWidgetState();
}

class _VerifyEmailWidgetState extends State<VerifyEmailWidget> {
  late final AuthServices auth;
  String _message = '';

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
      appBar: AppBar(title: Text("E-Mail bestätigen"), leading: SignOutButton(),),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                spacing: 20.0,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      await auth.reloadCurrentUser();
                      if (!mounted) return; // Safety check
                      setState(() {});
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text("Nochmal Überprüfen"),
                  ),
                  RichText(
                    overflow: TextOverflow.visible,
                    text: TextSpan(
                      text:
                          'Um sich anzumelden, bestätigen Sie bitte Ihre E-Mail-Adresse\n',
                      children: [
                        TextSpan(
                          text:
                              'Falls Sie sich bereits registriert haben und keine E-Mail erhalten haben, überprüfen Sie bitte Ihren Spam-Ordner.\n',
                        ),
                        TextSpan(
                          text:
                              'Sie können auch eine neue Bestätigungs-E-Mail anfordern.\n',
                        ),
                        TextSpan(
                          text:
                              'Sollten Sie weiterhin keine E-Mail erhalten haben, kontaktieren Sie bitte praxisasisstent.com@gmail.com',
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final email = auth.currentUser?.email;
                      if (email != null && email.isNotEmpty) {
                        try {
                          await auth.sendEmailVerification();
                          setState(() {
                            _message =
                                'Bestätigungs-E-Mail wurde an $email gesendet.';
                          });
                        } catch (e) {
                          setState(() {
                            _message = e.toString();
                          });
                        }
                      } else {
                        setState(() {
                          _message = 'Keine E-Mail-Adresse gefunden.';
                        });
                      }
                    },
                    child: Text("Bestätigungs-E-Mail anfordern"),
                  ),
                  if (_message.isNotEmpty)
                    Text(
                      _message,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
