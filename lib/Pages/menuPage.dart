import 'package:flutter/material.dart';

import '../models/menu_item.dart';
import '../models/panier.dart';
import '../services/api_service.dart';
import 'details_produit.dart';
import 'page_panier.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late Future<List<MenuItem>> _futureMenu;

  // Hardcoded category IDs (replace with real IDs from MongoDB)
  final String saladeCat = "69330ba0447f950ce6730f78";
  final String repasCat = "69330ba0447f950ce6730f79";
  final String boissonCat = "69330ba0447f950ce6730f7a";

  @override
  void initState() {
    super.initState();
    _futureMenu = ApiService.getMenu(); // fetch all menu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PagePanier()),
                  ).then((_) => setState(() {})); // refresh after return
                },
              ),
              if (Panier.items.isNotEmpty)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      Panier.items.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: FutureBuilder<List<MenuItem>>(
        future: _futureMenu,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return const Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text("Erreur: ${snapshot.error}"));

          final allItems = snapshot.data!;
          final salades = allItems
              .where((item) => item.platId == saladeCat)
              .toList();
          final repas = allItems
              .where((item) => item.platId == repasCat)
              .toList();
          final boissons = allItems
              .where((item) => item.platId == boissonCat)
              .toList();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _buildSection("Salades Fraîches", salades),
                _buildSection("Repas Africains & Internationaux", repas),
                _buildSection("Boissons rafraîchissantes", boissons),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSection(String title, List<MenuItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 20,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) => _buildCard(items[index]),
        ),
      ],
    );
  }

  Widget _buildCard(MenuItem item) {
    double scale = 1.0;

    return MouseRegion(
      onEnter: (_) => setState(() => scale = 1.05),
      onExit: (_) => setState(() => scale = 1.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsProduit(item: item)),
          ).then((_) => setState(() {})); // refresh top-right cart
        },
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(2, 2),
                ),
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(-2, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        item.titre,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${item.prix.toStringAsFixed(2)} CAD",
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            minimumSize: const Size(double.infinity, 30),
                          ),
                          onPressed: () {
                            Panier.add(item);
                            setState(() {}); // refresh top-right cart
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${item.titre} ajouté au panier"),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                          child: const Icon(Icons.add_shopping_cart, size: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
