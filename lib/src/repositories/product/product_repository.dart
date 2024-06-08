import 'dart:developer';

import 'package:riverpod_app/src/services/product/product_service.dart';

class ProductRepository {
  final ProductService productService;

  ProductRepository(this.productService);

  Future<Map<String, dynamic>> fetchAllProducts({
    int? limit,
    int? skip,
    String? query,
  }) async {
    try {
      return await productService.fetchAllProducts(
        query: query,
        skip: skip ?? 10,
      );
    } catch (e) {
      log("ERROR FETCH ALL PRODUCTS $e");
      throw Exception("Internal server error");
    }
  }
}
