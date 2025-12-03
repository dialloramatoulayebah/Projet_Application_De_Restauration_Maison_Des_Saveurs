import 'package:flutter/material.dart';
import 'panier.dart';
import 'payment.dart';

class PagePanier extends StatefulWidget {
  const PagePanier({super.key});

  @override
  State<PagePanier> createState() => _PagePanierState();
}

class _PagePanierState extends State<PagePanier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mon Panier")),
      body: Panier.items.isEmpty
          ? Center(child: Text("Votre panier est vide"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: Panier.items.length,
                    itemBuilder: (context, index) {
                      final produit = Panier.items[index];
                      return ListTile(
                        leading: Icon(Icons.shopping_cart),
                        title: Text(produit.nom),
                        subtitle: Text("${produit.prix} \$"),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              Panier.remove(produit);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      "${produit.nom} supprimé du panier")),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text("Total : ${Panier.total()} \$",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: Panier.items.isEmpty
                            ? null
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PagePaiement()),
                                );
                              },
                        child: Text("Procéder au paiement"),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
