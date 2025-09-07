import 'package:flutter/material.dart';
import 'package:praxisassistent/services/auth_services.dart';
import 'package:provider/provider.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async => await context.read<AuthServices>().signOut(),
      icon: Icon(Icons.logout),
      tooltip: 'Abmelden',
    );
  }
}
