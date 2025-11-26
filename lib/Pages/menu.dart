import 'package:flutter/material.dart';

class PageMenu extends StatelessWidget {
  const PageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page Menu")),
      body: const Center(
        child: Text("Bienvenue dans le menu !", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
