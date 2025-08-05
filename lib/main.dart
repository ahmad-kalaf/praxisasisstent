import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:praxisassistent/utils/theme.dart';
import 'package:praxisassistent/widgets/login_widget.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Start der Anwendung
  runApp(const PraxisassistentApp());
}

// Hauptanwendungsklasse
class PraxisassistentApp extends StatelessWidget {
  const PraxisassistentApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp-Widget, umschließt die gesamte App
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praxisassistent',
      theme: theme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  // Konstruktor der Homepage
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginWidget();
  }
}
