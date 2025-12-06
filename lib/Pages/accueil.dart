import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/menu_item.dart';
import '../models/panier.dart';
import '../services/api_service.dart';
import 'menuPage.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  bool _showChat = false;
  final TextEditingController _chatController = TextEditingController();
  final List<Widget> _messages = [];
  final ScrollController _scrollController = ScrollController();

  late Future<List<MenuItem>> _futureMenu;

  @override
  void initState() {
    super.initState();
    _futureMenu = ApiService.getMenu();
  }

  void _sendMessage(List<MenuItem> menuItems) {
    final text = _chatController.text.trim();
    if (text.isEmpty) return;

    // Add user message
    _messages.add(_buildUserMessage(text));
    _chatController.clear();

    // Add bot response immediately
    final responseWidgets = _getBotResponseWidgets(text, menuItems);
    _messages.addAll(responseWidgets);

    // Refresh UI once
    setState(() {});

    // Scroll to bottom
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  Widget _buildUserMessage(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.green.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildBotMessage(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text),
      ),
    );
  }

  List<Widget> _getBotResponseWidgets(
    String userMessage,
    List<MenuItem> menuItems,
  ) {
    userMessage = userMessage.toLowerCase();
    final widgets = <Widget>[];

    // Check menu items match
    final matches = menuItems
        .where((item) => item.titre.toLowerCase().contains(userMessage))
        .toList();

    if (matches.isNotEmpty) {
      widgets.add(_buildBotMessage("Voici ce que j'ai trouvé :"));
      widgets.add(
        Wrap(
          spacing: 6,
          runSpacing: 4,
          children: matches.map((item) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              onPressed: () {
                Panier.add(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${item.titre} ajouté au panier"),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Text(item.titre),
            );
          }).toList(),
        ),
      );
    } else if (userMessage.contains("salade")) {
      widgets.add(
        _buildBotMessage(
          "Nous avons plusieurs salades fraîches: Salade Niçoise, Salade César, etc.",
        ),
      );
    } else if (userMessage.contains("repas")) {
      widgets.add(
        _buildBotMessage(
          "Nos repas incluent Poulet Yassa, Couscous, Tiep Bou Dien, etc.",
        ),
      );
    } else if (userMessage.contains("boisson")) {
      widgets.add(
        _buildBotMessage(
          "Nous avons des jus, sodas et boissons traditionnelles africaines.",
        ),
      );
    } else if (userMessage.contains("prix")) {
      widgets.add(
        _buildBotMessage(
          "Les prix varient selon le plat, généralement entre 5 et 20 CAD.",
        ),
      );
    } else {
      widgets.add(
        _buildBotMessage(
          "Je suis désolé, pouvez-vous préciser votre question sur nos plats ?",
        ),
      );
    }

    return widgets;
  }

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
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset("assets/images/accueil_1.jpeg", fit: BoxFit.cover),

          // Main content
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Image.asset(
                    "assets/images/Logo.jpeg",
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Bienvenue à la Maison des Saveurs!",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Goûtez, Partagez, Vivez l'Afrique!",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Inscrivez-vous pour avoir des bonus exclusifs!",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Navigate to MenuPage
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                    ),
                    child: const Text(
                      "Aller au Menu",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Social buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => openURL("https://www.google.com"),
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () => openURL("https://www.facebook.com"),
                        icon: const FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () => openURL("https://www.instagram.com"),
                        icon: const FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Chat Bot
          Positioned(
            bottom: 20,
            right: 20,
            child: FutureBuilder<List<MenuItem>>(
              future: _futureMenu,
              builder: (context, snapshot) {
                final menuItems = snapshot.hasData
                    ? snapshot.data!
                    : <MenuItem>[];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_showChat)
                      Container(
                        width: 300,
                        height: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Chat Bot",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                controller: _scrollController,
                                padding: const EdgeInsets.all(8),
                                children: _messages,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _chatController,
                                      decoration: const InputDecoration(
                                        hintText: "Écrivez un message...",
                                        isDense: true,
                                        border: OutlineInputBorder(),
                                      ),
                                      onSubmitted: (_) =>
                                          _sendMessage(menuItems),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.send),
                                    onPressed: () => _sendMessage(menuItems),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.green,
                      onPressed: () {
                        setState(() {
                          _showChat = !_showChat;
                        });
                      },
                      child: Icon(_showChat ? Icons.close : Icons.chat),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Function to open external URLs
Future<void> openURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception("Impossible d’ouvrir le lien : $url");
  }
}
