import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("MaisonDesSaveurs")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("asset/images/Logo.jpeg"),
              Text(
                "Bienvenue à la Maison des Saveurs!",
                style: TextStyle(fontSize: 20, fontFamily: 'Arial'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
