import 'dart:convert';
import 'package:yapp/models/itemmaroon.dart';
import 'package:http/http.dart' as http;

class ItemService {
  static const _baseUrl =
      'https://prak-labkom-mobpro.000webhostapp.com/api/maroons';
  static Future<void> createItem(Item item) async {
    final response = await http.post(Uri.parse(_baseUrl),
        body: json.encode({'name': item.name, 'message': item.message}),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode != 200) {
      throw Exception('Failed to create item');
    }
  }

  static Future<List<Item>> readItems() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      return data.map((itemJson) => Item.fromJson(itemJson)).toList();
    } else {
      throw Exception('Failed to read items');
    }
  }

  static Future<void> updateItem(int id, String name, String npm) async {
    final response = await http.put(Uri.parse('$_baseUrl/$id'),
        body: json.encode({'npm': npm, 'name': name}),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode != 200) {
      throw Exception('Failed to update item');
    }
  }

  static Future<void> deleteItem(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete item');
    }
  }
}
