import 'dart:async';
import 'dart:developer';

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

@riverpod
class SearchProductNotifier extends _$SearchProductNotifier {
  Timer? _debounce;

  @override
  String build() {
    ref.onDispose(() {
      _debounce?.cancel();
    });
    return "";
  }

  void setQuery(String query) {
    if (_debounce != null) {
      _debounce!.cancel();
    }

    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        state = query;
        log("STATE: $query");
      },
    );
  }
}
