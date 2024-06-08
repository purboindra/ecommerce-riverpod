import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:riverpod_app/src/data/product_model.dart';
import 'package:riverpod_app/src/utils/constant.dart';

class ProductService {
  Future<Map<String, dynamic>> fetchAllProducts({
    int? skip,
    String? query,
  }) async {
    try {
      String url = "$baseUrl/products?skip=$skip&limit=${10}";

      if (query != null && query.isNotEmpty) {
        url = "$baseUrl/products/search?q=$query";
      }

      final response = await http.get(Uri.parse(url));

      if (response.statusCode != 200) throw Exception("Something went wrong");

      final decode = jsonDecode(response.body);

      final products = List.from(decode["products"])
          .map((product) => ProductModel.fromJson(product))
          .toList();

      return {
        "products": products,
        "limit": decode["limit"],
        "skip": decode["skip"],
        "total": decode["total"]
      };
    } catch (e, st) {
      log("ERROR FETCH PRODUCTS $e $st");
      rethrow;
    }
  }
}
