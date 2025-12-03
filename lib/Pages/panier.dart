import 'produit.dart';

class Panier {
  static final List<Salade> items = [];

  static void a(Salade s) => items.add(s);

  static void remove(Salade s) => items.remove(s);

  static double total() => items.fold(0, (sum, s) => sum + s.prix);

  static void clear() => items.clear();
}
