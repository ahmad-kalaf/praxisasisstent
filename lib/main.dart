import 'package:flutter/material.dart';

void main() {
  runApp(const PraxisassistentApp());
}

class PraxisassistentApp extends StatelessWidget {
  const PraxisassistentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praxisassistent',
      home: const MyHomePage(title: 'Startbildschirm'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(child: Center(child: Text("Platzhalter")));
  }
}
