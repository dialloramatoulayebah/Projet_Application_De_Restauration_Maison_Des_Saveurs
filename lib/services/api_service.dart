import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/category.dart';
import '../models/menu_item.dart';

class ApiService {
  static const String baseUrl = "http://127.0.0.1:5000"; // Or your LAN IP

  // Fetch all categories
  static Future<List<Categorie>> getCategories() async {
    final response = await http.get(Uri.parse("$baseUrl/categories"));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Categorie.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load categories");
    }
  }

  // Fetch all menu items
  static Future<List<MenuItem>> getMenu() async {
    final response = await http.get(Uri.parse("$baseUrl/menu"));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => MenuItem.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load menu");
    }
  }

  // Fetch menu items by category
  static Future<List<MenuItem>> getMenuByCategory(String catId) async {
    final response = await http.get(Uri.parse("$baseUrl/menu/category/$catId"));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => MenuItem.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load menu by category");
    }
  }
}
