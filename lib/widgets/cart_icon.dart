import 'package:flutter/material.dart';

import '../models/panier.dart';

class CartIcon extends StatefulWidget {
  final VoidCallback onPressed;

  const CartIcon({super.key, required this.onPressed});

  @override
  State<CartIcon> createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart, size: 28),
          onPressed: () {
            setState(() {});
            widget.onPressed();
          },
        ),
        // Badge
        Positioned(
          right: 0,
          top: 0,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.red,
            child: Text(
              Panier.count().toString(),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
