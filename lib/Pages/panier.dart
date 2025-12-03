import 'produit.dart';

class Panier {
  static final List<Produit> items = [];

  static void add(Produit p) => items.add(p);

  static void remove(Produit p) => items.remove(p);

  static double total() => items.fold(0, (sum, p) => sum + p.prix);

  static void clear() => items.clear();
}
