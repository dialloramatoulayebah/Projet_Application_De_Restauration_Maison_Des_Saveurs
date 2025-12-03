class Produit {
  final String nom;
  final String description;
  final double prix;
  final String image;

  Produit({
    required this.nom,
    required this.description,
    required this.prix,
    required this.image,
  });
}

class Salade extends Produit {
  Salade({
    required super.nom,
    required super.description,
    required super.prix,
    required super.image,
  });
}
class Repas extends Produit {
  Repas({
    required super.nom,
    required super.description,
    required super.prix,
    required super.image,
  });
}
class Boisson extends Produit {
  Boisson({
    required super.nom,
    required super.description,
    required super.prix,
    required super.image,
  });
}