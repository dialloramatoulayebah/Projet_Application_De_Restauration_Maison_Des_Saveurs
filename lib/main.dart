import 'package:flutter/material.dart';

import 'Pages/accueil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AccueilPage(), // Charger la page accueil
    );
  }
}
