import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item_model.dart';

class ApiService {
  static const String baseUrl = 'https://api.tvmaze.com/shows';

  static Future<List<ItemModel>> fetchItems() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => ItemModel.fromJson(e)).toList();
    } else {
      throw Exception('Gagal memuat daftar show');
    }
  }

  static Future<ItemModel> fetchItemDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return ItemModel.fromJson(data);
    } else {
      throw Exception('Gagal memuat detail show');
    }
  }
}