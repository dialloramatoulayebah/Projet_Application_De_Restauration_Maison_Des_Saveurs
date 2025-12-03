import 'package:flutter/material.dart';

import 'detail_menu.dart';
import 'page_pannier.dart';
import 'pannier.dart';
import 'produit.dart';

class ListProduits extends StatelessWidget {
  ListProduits({super.key});

  final List<Produit> produits = [
    Produit(
      nom: "Salade César",
      description: "Salade fraîche avec poulet grillé et parmesan.",
      prix: 12.0,
      image: "assets/images/salades/saladesoeufs.jpeg",
    ),
    Produit(
      nom: "Salade Fruits",
      description: "Mélange de fruits frais.",
      prix: 9.0,
      image: "assets/images/salades/Saladelegumes.jpg",
    ),
    Produit(
      nom: "Salade Créole",
      description: "Salade épicée façon créole.",
      prix: 14.0,
      image: "assets/images/salades/salades3.jpg",
    ),
    Produit(
      nom: "Salade poulet braisé",
      description: "Salade épicée façon créole.",
      prix: 7.0,
      image: "assets/images/salades/salades3.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Salades"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PagePanier()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: produits.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 7, //
            mainAxisSpacing: 12,
            childAspectRatio: 0.7,
            // ← hauteur fixe de chaque item (ajuste 220–260 selon ton design)
          ),
          itemBuilder: (context, index) {
            final produit = produits[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsProduit(produit: produit),
                  ),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(produit.image, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    produit.nom,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "${produit.prix} \$",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      Pannier.add(produit);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${produit.nom} ajouté au panier"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
