import 'menu_item.dart';

class Panier {
  // Private constructor
  Panier._privateConstructor();

  // Singleton instance
  static final Panier _instance = Panier._privateConstructor();

  factory Panier() {
    return _instance;
  }

  // The list that stores added items
  static final List<MenuItem> _items = [];

  // Add an item
  static void add(MenuItem item) {
    _items.add(item);
  }

  // Remove an item
  static void remove(MenuItem item) {
    _items.remove(item);
  }

  // Get all items
  static List<MenuItem> get items => List.unmodifiable(_items);

  // Get total price
  static double get totalPrice =>
      _items.fold(0.0, (sum, item) => sum + item.prix);

  // Clear the cart
  static void clear() {
    _items.clear();
  }
}
