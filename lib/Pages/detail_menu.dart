import 'package:flutter/material.dart';

import 'produit.dart';

class DetailsProduit extends StatelessWidget {
  final Produit produit;
  const DetailsProduit({super.key, required this.produit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(produit.nom)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nom : ${produit.nom}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Prix : ${produit.prix} CAD", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Description :", style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            Text(produit.description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
