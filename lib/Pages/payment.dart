import 'package:flutter/material.dart';
import 'panier.dart';

class PagePaiement extends StatefulWidget {
  const PagePaiement({super.key});

  @override
  State<PagePaiement> createState() => _PagePaiementState();
}

class _PagePaiementState extends State<PagePaiement> {
  String? methodePaiement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paiement")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Montant à payer :",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("${Panier.total()} \$",
                style: TextStyle(fontSize: 22, color: Colors.green)),
            SizedBox(height: 25),
            Text("Méthode de paiement",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            RadioListTile(
              title: Text("Carte bancaire"),
              value: "carte",
              groupValue: methodePaiement,
              onChanged: (value) => setState(() => methodePaiement = value),
            ),
            RadioListTile(
              title: Text("PayPal"),
              value: "paypal",
              groupValue: methodePaiement,
              onChanged: (value) => setState(() => methodePaiement = value),
            ),
            RadioListTile(
              title: Text("Paiement cash"),
              value: "cash",
              groupValue: methodePaiement,
              onChanged: (value) => setState(() => methodePaiement = value),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: methodePaiement == null
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Paiement réussi"),
                            content: Text(
                                "Merci ! Votre paiement par $methodePaiement a été accepté."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Panier.clear();
                                  Navigator.popUntil(context, (r) => r.isFirst);
                                },
                                child: Text("OK"),
                              )
                            ],
                          ),
                        );
                      },
                child: Text("Confirmer le paiement"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
