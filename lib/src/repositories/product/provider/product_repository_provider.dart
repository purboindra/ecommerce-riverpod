import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/src/repositories/product/product_repository.dart';
import 'package:riverpod_app/src/services/product/provider/product_service_provider.dart';

part 'product_repository_provider.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepository(ref.watch(productServiceProvider));
}
