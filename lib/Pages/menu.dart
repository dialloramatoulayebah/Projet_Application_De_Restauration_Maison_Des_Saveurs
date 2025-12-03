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
      description:
          "Poisson grillé accompagné d’alloco (bananes plantains frites), servi avec une petite sauce maison.",
      prix: 18.00,
      image: "assets/images/Repas/allocopoisson.jpeg",
    ),
    Repas(
      nom: "Attiéké Poisson",
      description:
          "Attiéké ivoirien accompagné d’un poisson braisé, tomate, oignon, piment et sauce verte traditionnelle.",
      prix: 17.00,
      image: "assets/images/Repas/attiekepoisssson.jpg",
    ),
    Repas(
      nom: "Tajine Marocain aux Pruneaux",
      description:
          "Tajine marocain traditionnel à la viande, pruneaux, amandes et épices orientales.",
      prix: 20.00,
      image: "assets/images/Repas/tajine-marocain-aux-pruneaux.jpg",
    ),
    Repas(
      nom: "Tajine Marocain Traditionnel",
      description:
          "Tajine aux légumes variés, épices marocaines et viande tendre cuite lentement.",
      prix: 18.00,
      image: "assets/images/Repas/salades12.jpg",
    ),
    Repas(
      nom: "Brochettes Grillées",
      description:
          "Brochettes de viande marinée, grillées au feu et servies avec une sauce épicée.",
      prix: 15.00,
      image: "assets/images/Repas/Brochette.jpeg",
    ),
    Repas(
      nom: "Riz Sauce Arachide",
      description:
          "Riz blanc accompagné d’une sauce onctueuse à base d’arachide et de viande mijotée.",
      prix: 14.00,
      image: "assets/images/Repas/rizsaucearachide.jpeg",
    ),
    Repas(
      nom: "chièp (Thieboudienne)",
      description:
          "Riz sénégalais parfumé, servi avec poisson, carottes, chou et légumes mijotés.",
      prix: 19.00,
      image: "assets/images/Repas/Tchiep.jpg",
    ),
    Repas(
      nom: "Salade poulet braisé",
      description:
          "Soupe ou ragoût nourrissant à base de pois chiches, de couscous perlé (Maftoul), de carottes et de courgettes, dans un bouillon épicé à la tomate. Servi avec des quartiers d'œuf dur.",
      prix: 12.00,
      image: "assets/images/Repas/soupeauxpoischiche.jpeg",
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
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Salades Fraîches",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GridView.builder(
              itemCount: produits.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 9,
                mainAxisSpacing: 20,
                mainAxisExtent: 300,
                //childAspectRatio: 0.7,
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
                          Panier.add(produit);
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
          ],
        ),
      ),
    );
  }
}
