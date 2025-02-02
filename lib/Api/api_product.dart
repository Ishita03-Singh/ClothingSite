import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/product.dart';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://your-api-url.com/products'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);

    // Convert each item in the JSON list into a Product object
    return jsonResponse.map((product) => Product.fromJson(product)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
