class MenuItem {
  final String id;
  final String platId;
  final String titre;
  final double prix;
  final String imageUrl;
  final String? description; // new field

  MenuItem({
    required this.id,
    required this.platId,
    required this.titre,
    required this.prix,
    required this.imageUrl,
    this.description,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['_id'] ?? '',
      platId: json['platId'] ?? '',
      titre: json['titre'] ?? '',
      prix: (json['prix'] ?? 0).toDouble(),
      imageUrl: json['image_url'] ?? '',
      description: json['description'], // map description
    );
  }
}
