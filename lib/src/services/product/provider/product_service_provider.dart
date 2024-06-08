import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/src/services/product/product_service.dart';

part 'product_provider.g.dart';

@riverpod
ProductService productService(ProductServiceRef ref) {
  return ProductService();
}
