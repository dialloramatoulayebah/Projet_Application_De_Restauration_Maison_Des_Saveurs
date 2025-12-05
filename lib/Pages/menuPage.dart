import 'package:flutter/material.dart';

import '../models/menu_item.dart';
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
        title: Text("Menu"),
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
      body: FutureBuilder<List<MenuItem>>(
        future: _futureMenu,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
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
            padding: EdgeInsets.all(10),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 20,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) => _buildCard(items[index]),
        ),
      ],
    );
  }

  Widget _buildCard(MenuItem item) {
    return GestureDetector(
      onTap: () {
        // Navigate to DetailsProduit page when card is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsProduit(item: item)),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                item.titre,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              "${item.prix.toStringAsFixed(2)} CAD",
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
