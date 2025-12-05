import 'package:flutter/material.dart';

import '../models/menu_item.dart';
import '../models/panier.dart';

class DetailsProduit extends StatefulWidget {
  final MenuItem item;

  const DetailsProduit({super.key, required this.item});

  @override
  State<DetailsProduit> createState() => _DetailsProduitState();
}

class _DetailsProduitState extends State<DetailsProduit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item.titre)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            Image.asset(
              widget.item.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            // TITLE
            Text(
              widget.item.titre,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // DESCRIPTION
            Text(
              widget.item.description ?? "Aucune description disponible.",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            // ADD TO CART BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton.icon(
                onPressed: () {
                  Panier.add(widget.item);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${widget.item.titre} ajouté au panier"),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text("Ajouter au panier"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
