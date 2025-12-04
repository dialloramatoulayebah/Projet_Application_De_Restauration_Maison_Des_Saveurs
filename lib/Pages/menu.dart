import 'package:app_de_restauration_maison_des_saveurs/Pages/detail_menu.dart';
import 'package:flutter/material.dart';

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
      image: "assets/images/Repas/attiekepoissson.jpg",
    ),
    Repas(
      nom: "Tajine Marocain aux Pruneaux",
      description: "Tajine marocain traditionnel.",
      prix: 20.00,
      image: "assets/images/Repas/tajine-marocain-aux-pruneaux.jpg",
    ),
    Repas(
      nom: "Tajine Marocain Traditionnel",
      description:
          "Tajine aux légumes variés, épices marocaines et viande tendre cuite lentement.",
      prix: 18.00,
      image: "assets/images/Repas/tajine-traditionnel-marocain.jpeg",
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
  final List<Boisson> boissons = [
    Boisson(
      nom: "Jus de Bissap",
      description:
          "Boisson rafraîchissante à base de fleurs d’hibiscus, légèrement sucrée et acidulée, très populaire en Afrique de l’Ouest.",
      prix: 3.50,
      image: "assets/images/Boisson/bissap.jpg",
    ),
    Boisson(
      nom: "Jus d’Ananas",
      description:
          "Jus naturel d’ananas frais, riche en vitamines et parfait pour une pause tropicale.",
      prix: 4.00,
      image: "assets/images/Boisson/jusananas.jpg",
    ),
    Boisson(
      nom: "Jus de Baobab",
      description:
          "Boisson nutritive à base de pulpe de baobab, légèrement acidulée et riche en antioxydants.",
      prix: 4.00,
      image: "assets/images/Boisson/jusdebaobab.jpg",
    ),
    Boisson(
      nom: "Jus de Citron",
      description:
          "Jus frais de citron, désaltérant et riche en vitamine C, idéal pour se rafraîchir.",
      prix: 3.00,
      image: "assets/images/Boisson/jusdecitron.jpg",
    ),
    Boisson(
      nom: "Jus de Gingembre",
      description:
          "Boisson tonique à base de gingembre frais, légèrement piquante et énergisante.",
      prix: 4.00,
      image: "assets/images/Boisson/jusgingembre.jpeg",
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
        padding: const EdgeInsets.all(10),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SECTION SALADES -----------------------------------------
            const Text(
              "Découvrez nos délicieus plats préparés avec soin ! et cliquez sur un plat pour voir les détails.",
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Salades Fraîches",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 10),

            GridView.builder(
              itemCount: produits.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 4 colonnes pour desktop
                crossAxisSpacing: 12,
                mainAxisSpacing: 20,
                childAspectRatio: 1.00,
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
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 20,
                childAspectRatio: 1.00,
              ),

              itemBuilder: (context, index) {
                final dish = repas[index];
                return _buildProduitCard(context, dish);
              },
            ),
            const SizedBox(height: 20),

            // SECTION BOISSONS -----------------------------------------
            const Text(
              "Savourez nos meilleures boissons",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            GridView.builder(
              itemCount: boissons.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 20,
                childAspectRatio: 1.00,
              ),

              itemBuilder: (context, index) {
                final boisson = boissons[index];
                return _buildProduitCard(context, boisson);
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // WIDGET : Carte produit / repas réutilisable -------------------------------
  Widget _buildProduitCard(BuildContext context, Produit produit) {
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
            "${produit.prix} CAD",
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
