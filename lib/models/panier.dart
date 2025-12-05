import 'menu_item.dart';

class Panier {
  Panier._privateConstructor();
  static final Panier _instance = Panier._privateConstructor();
  factory Panier() => _instance;

  static final List<MenuItem> _items = [];

  static void add(MenuItem item) {
    _items.add(item);
  }

  static void remove(MenuItem item) {
    _items.remove(item);
  }

  static List<MenuItem> get items => List.unmodifiable(_items);

  static double get totalPrice =>
      _items.fold(0.0, (sum, item) => sum + item.prix);

  static void clear() {
    _items.clear();
  }
}
