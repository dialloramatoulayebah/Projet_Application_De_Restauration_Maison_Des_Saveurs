import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedMethod = 'Carte de Crédit';

  // Controllers for credit/debit card input
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardNameController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardNameController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paiement")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Comment souhaitez-vous payer ?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Payment options
            RadioListTile<String>(
              value: 'Carte de Crédit',
              groupValue: _selectedMethod,
              onChanged: (value) {
                setState(() {
                  _selectedMethod = value!;
                });
              },
              title: const Text("Carte de Crédit / Débit"),
              secondary: const Icon(Icons.credit_card),
            ),
            RadioListTile<String>(
              value: 'PayPal',
              groupValue: _selectedMethod,
              onChanged: (value) {
                setState(() {
                  _selectedMethod = value!;
                });
              },
              title: const Text("PayPal"),
              secondary: const Icon(Icons.account_balance_wallet),
            ),
            RadioListTile<String>(
              value: 'Google Pay',
              groupValue: _selectedMethod,
              onChanged: (value) {
                setState(() {
                  _selectedMethod = value!;
                });
              },
              title: const Text("Google Pay"),
              secondary: const Icon(Icons.payment),
            ),

            // Conditional credit/debit card form
            if (_selectedMethod == 'Carte de Crédit') ...[
              const SizedBox(height: 20),
              TextField(
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Numéro de carte",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _cardNameController,
                decoration: const InputDecoration(
                  labelText: "Nom sur la carte",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _expiryController,
                      decoration: const InputDecoration(
                        labelText: "MM/AA",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _cvvController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "CVV",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ],

            const Spacer(),

            // Pay button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String msg = "";
                  if (_selectedMethod == 'Carte de Crédit') {
                    if (_cardNumberController.text.isEmpty ||
                        _cardNameController.text.isEmpty ||
                        _expiryController.text.isEmpty ||
                        _cvvController.text.isEmpty) {
                      msg = "Veuillez remplir tous les champs de la carte.";
                    } else {
                      msg = "Paiement simulé avec Carte de Crédit réussi !";
                    }
                  } else {
                    msg = "Paiement simulé avec $_selectedMethod réussi !";
                  }

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Paiement"),
                      content: Text(msg),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (msg.contains("réussi")) {
                              Navigator.of(context).pop(); // go back
                            }
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  backgroundColor: Colors.green,
                ),
                child: const Text("Payer", style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
