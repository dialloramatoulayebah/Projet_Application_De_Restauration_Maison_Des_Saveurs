import 'package:flutter/material.dart';

import 'detail_menu.dart';
import 'page_panier.dart';
import 'panier.dart';
import 'produit.dart';

class ListProduits extends StatelessWidget {
  ListProduits({super.key});

  final List<Salade> produits = [
    Salade(
      nom: "Salade César",
      description: "Salade fraîche avec poulet grillé et parmesan.",
      prix: 12.00,
      image: "assets/images/salades/saladesoeufs.jpeg",
    ),
    Salade(
      nom: "Salade Fruits",
      description: "Mélange de fruits frais.",
      prix: 9.00,
      image: "assets/images/salades/Saladelegumes.jpg",
    ),
    Salade(
      nom: "Salade Créole",
      description: "Salade épicée façon créole.",
      prix: 14.00,
      image: "assets/images/salades/salades3.jpg",
    ),
    Salade(
      nom: "Salade poulet braisé",
      description: "Salade épicée façon créole.",
      prix: 7.00,
      image: "assets/images/salades/salades12.jpg",
    ),
  ];

  final List<Repas> repas = [
    Repas(
      nom: "Alloco Poisson",
      description: "Poisson grillé accompagné d’alloco.",
      prix: 18.00,
      image: "assets/images/Repas/allocopoisson.jpeg",
    ),
    Repas(
      nom: "Attiéké Poisson",
      description: "Attiéké ivoirien et poisson braisé.",
      prix: 17.00,
      image: "assets/images/Repas/attiekepoisssson.jpg",
    ),
    Repas(
      nom: "Tajine Marocain aux Pruneaux",
      description: "Tajine marocain traditionnel.",
      prix: 20.00,
      image: "assets/images/Repas/tajine-marocain-aux-pruneaux.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
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

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SECTION SALADES -----------------------------------------
            const Text(
              "Salades Fraîches",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            GridView.builder(
              itemCount: produits.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 colonnes pour mobile
                crossAxisSpacing: 12,
                mainAxisSpacing: 20,
                childAspectRatio: 0.70,
              ),

              itemBuilder: (context, index) {
                final produit = produits[index];
                return _buildProduitCard(context, produit);
              },
            ),

            const SizedBox(height: 20),

            // SECTION REPAS -----------------------------------------
            const Text(
              "Repas Africains & Internationaux",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            GridView.builder(
              itemCount: repas.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 20,
                childAspectRatio: 0.70,
              ),

              itemBuilder: (context, index) {
                final dish = repas[index];
                return _buildProduitCard(context, dish);
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // WIDGET : Carte produit / repas réutilisable -------------------------------
  Widget _buildProduitCard(BuildContext context, dynamic produit) {
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
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            "${produit.prix} \$",
            style: const TextStyle(
              color: Colors.green,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              Panier.add(produit);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${produit.nom} ajouté au panier")),
              );
            },
          ),
        ],
      ),
    );
  }
}
