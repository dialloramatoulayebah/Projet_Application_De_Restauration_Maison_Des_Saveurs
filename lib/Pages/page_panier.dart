import 'package:flutter/material.dart';

import '../models/menu_item.dart';
import '../models/panier.dart';
import 'page_payment.dart'; // import your PaymentPage

class PagePanier extends StatefulWidget {
  const PagePanier({super.key});

  @override
  _PagePanierState createState() => _PagePanierState();
}

class _PagePanierState extends State<PagePanier> {
  // To track quantities per item
  final Map<MenuItem, int> _quantities = {};

  @override
  void initState() {
    super.initState();
    _initQuantities();
  }

  void _initQuantities() {
    for (var item in Panier.items) {
      if (_quantities.containsKey(item)) {
        _quantities[item] = _quantities[item]! + 1;
      } else {
        _quantities[item] = 1;
      }
    }
  }

  void _increment(MenuItem item) {
    setState(() {
      _quantities[item] = (_quantities[item] ?? 0) + 1;
      Panier.add(item);
    });
  }

  void _decrement(MenuItem item) {
    if (_quantities[item]! > 1) {
      setState(() {
        _quantities[item] = _quantities[item]! - 1;
        Panier.remove(item);
      });
    } else {
      setState(() {
        _quantities.remove(item);
        Panier.remove(item);
      });
    }
  }

  double _calculateTotal() {
    double total = 0.0;
    _quantities.forEach((item, qty) {
      total += item.prix * qty;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    if (_quantities.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("Panier")),
        body: const Center(child: Text("Votre panier est vide")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Panier")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ..._quantities.entries.map((entry) {
            final item = entry.key;
            final qty = entry.value;
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Image.asset(
                  item.imageUrl,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(item.titre),
                subtitle: Text("${item.prix.toStringAsFixed(2)} CAD"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => _decrement(item),
                    ),
                    Text(qty.toString()),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () => _increment(item),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          const SizedBox(height: 20),
          Card(
            color: Colors.green.shade100,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Total: ${_calculateTotal().toStringAsFixed(2)} CAD",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                Panier.clear();
                _quantities.clear();
              });
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Panier vidé !")));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Vider le panier"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to PaymentPage for simulated payment
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentPage()),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text("Payer"),
          ),
        ],
      ),
    );
  }
}
