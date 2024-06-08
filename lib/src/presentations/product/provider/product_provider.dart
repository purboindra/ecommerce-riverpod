import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/src/repositories/product/provider/product_repository_provider.dart';

part 'product_provider.g.dart';

final totalPageProvider = StateProvider<int>((ref) {
  return 0;
});

final totalItemsProvider = StateProvider<int>((ref) {
  return 0;
});

final limitProvider = StateProvider<int>((ref) {
  return 10;
});

final skipProvider = StateProvider<int>((ref) {
  return 1;
});

final pageProvider = StateProvider<int>((ref) {
  return 1;
});

final queryProvider = StateProvider<String>((ref) {
  return "";
});

@riverpod
Future<Map<String, dynamic>> fetchAllProducts(FetchAllProductsRef ref,
    {int? limit, int? skip, String? query}) async {
  final result = await ref
      .read(productRepositoryProvider)
      .fetchAllProducts(limit: limit, query: query, skip: skip);

  ref.read(totalItemsProvider.notifier).update(
        (state) => result["total"],
      );

  final totalPage = (int.parse(result["total"].toString()) / 10).ceil();

  ref.read(totalPageProvider.notifier).update(
        (state) => totalPage,
      );

  return result;
}
