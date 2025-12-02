import 'produit.dart';

class Pannier {
  static final List<Produit> items = [];

  static void add(Produit p) => items.add(p);

  static void remove(Produit p) => items.remove(p);

  static double total() => items.fold(0, (sum, item) => sum + item.prix);

  static void clear() => items.clear();
}