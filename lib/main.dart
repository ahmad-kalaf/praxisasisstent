import 'package:flutter/material.dart';
import 'package:praxisassistent/utils/constants.dart';

void main() {
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
    return Scaffold(
      // AppBar mit Titel und Hintergrundfarbe
      appBar: AppBar(
        title: const Text('Praxisassistent'),
        centerTitle: true,
        backgroundColor: kAppBarBackgroundColor,
        titleTextStyle: TextStyle(
          fontSize: kDefaultAppBarFontSize,
          color: kDefaultTextColor,
        ),
      ),
      // Container mit Gradient-Hintergrundfarbe (Farbverlauf)
      // Dieser Container umschließt die weiteren Widgets im Body der HomePage
      body: Container(
        decoration: BoxDecoration(
          // Gradient-Hintergrundfarbe (Linearer Farbverlauf von unten links nach oben rechts)
          gradient: LinearGradient(
            colors: [kScaffoldGradientStartColor, kScaffoldGradientEndColor],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: SafeArea(
          // Sicherer Bereich, um Inhalte nicht hinter der Stautsleiste oder
          // anderen UI-Elementen des Betriebssystems zu verstecken
          child: Center(
            child: Text(
              'Willkommen im Praxisassistent',
              style: TextStyle(
                fontSize: kDefaultBodyFontSize,
                color: kDefaultTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
