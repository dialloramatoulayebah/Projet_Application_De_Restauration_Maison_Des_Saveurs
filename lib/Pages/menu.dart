import 'package:flutter/material.dart';
import 'detail_menu.dart';
import 'pannier.dart';
import 'produit.dart';  
import 'page_pannier.dart';
class ListProduits extends StatelessWidget {
  ListProduits({super.key});

  final List<Produit> produits = [
    Produit(
      nom: "Salade César",
      description: "Salade fraîche avec poulet grillé et parmesan.",
      prix: 12.0,
      image: "assets/salade.jpeg",
    ),
    Produit(
      nom: "Salade Fruits",
      description: "Mélange de fruits frais.",
      prix: 9.0,
      image: "assets/fruits.jpeg",
    ),
    Produit(
      nom: "Salade Créole",
      description: "Salade épicée façon créole.",
      prix: 14.0,
      image: "assets/creole.jpeg",
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
          )
        ],
      ),

      // 🌟 GRID VIEW
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: produits.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,      // 3 produits par ligne
            crossAxisSpacing: 12,   // espace horizontal
            mainAxisSpacing: 12,    // espace vertical
            childAspectRatio: 0.7,  // taille du card
          ),
          itemBuilder: (context, index) {
            final produit = produits[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsProduit(produit: produit)),
                );
              },
              child: Column(
                children: [
                  // IMAGE
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images//accueil_1.jpeg",
                        fit: BoxFit.cover,
                        // width: double.infinity,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  // NOM
                  Text(
                    produit.nom,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),

                  // PRIX
                  Text(
                    "${produit.prix} \$",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // BOUTON AJOUT PANIER
                  IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      Pannier.add(produit);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text("${produit.nom} ajouté au panier"),
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
