import 'package:flutter/material.dart';
import 'package:praxisassistent/services/auth_services.dart';
import 'package:praxisassistent/widgets/account_settings_screen.dart';
import 'package:praxisassistent/widgets/login_widget.dart';
import 'package:praxisassistent/widgets/verify_email_widget.dart';
import 'package:provider/provider.dart';

class AuthGateWidget extends StatefulWidget {
  const AuthGateWidget({super.key});

  @override
  State<AuthGateWidget> createState() => _AuthGateWidgetState();
}

class _AuthGateWidgetState extends State<AuthGateWidget> {
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
    },);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: const CircularProgressIndicator.adaptive());
        } else if (snapshot.hasData && auth.currentUser != null && auth.currentUser!.emailVerified) {
          return const AccountSettingsScreen();
        } else if (snapshot.hasData && auth.currentUser != null && !auth.currentUser!.emailVerified) {
          return const VerifyEmailWidget();
        } else {
          return const LoginWidget();
        }
      },
    );
  }
}
