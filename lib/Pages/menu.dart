import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  final String status; // <- Exemple de paramètre typé

  const Menu(this.status, {super.key});

  @override
  State<Menu> createState() => _MenuState(); // <- createState correct
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    // Tu peux utiliser le paramètre passé avec widget.status
    return Scaffold(
      appBar: AppBar(title: Text('Menu (${widget.status})')),
      body: const Placeholder(),
    );
  }
}
