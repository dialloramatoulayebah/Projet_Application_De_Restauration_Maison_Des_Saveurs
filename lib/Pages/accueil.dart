import 'package:app_de_restauration_maison_des_saveurs/Pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'Icon.dart';

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MaisonDesSaveurs",
          style: TextStyle(
            color: Colors.green,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/images/Logo.jpeg", width: 200, height: 200),
            const SizedBox(height: 10),

            const Text(
              "Bienvenue à la Maison des Saveurs!",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),

            const Text(
              "Goûtez, Partagez, Vivez l'Afrique!",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 5),

            const Text(
              "Inscrivez-vous pour avoir des bonus exclusifs!",
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => openURL("https://www.google.com"),
              child: const FaIcon(FontAwesomeIcons.google, color: Colors.red),
            ),
            const SizedBox(width: 50),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => openURL("https://www.facebook.com"),
              child: const FaIcon(
                FontAwesomeIcons.facebook,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 50),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => openURL("https://www.instagram.com"),
              child: const FaIcon(
                FontAwesomeIcons.instagram,
                color: Colors.pink,
              ),
            ),
            const SizedBox(width: 50),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageMenu()),
                );
              },
              child: const Text("Aller au Menu"),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> openURL(String url) async {
  final Uri uri = Uri.parse(url);

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception("Impossible d’ouvrir le lien : $url");
  }
}
