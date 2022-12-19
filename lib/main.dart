import 'package:flutter/material.dart';

import 'screens/prime/prime_screen.dart';

void main() {
  runApp(const PrimeApp());
}

class PrimeApp extends StatelessWidget {
  const PrimeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prime Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PrimeScreen(),
    );
  }
}
