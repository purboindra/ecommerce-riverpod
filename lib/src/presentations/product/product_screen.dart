import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/src/data/product_model.dart';
import 'package:riverpod_app/src/presentations/product/provider/product_provider.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPage = ref.watch(totalPageProvider);
    final limit = ref.watch(limitProvider);
    final skip = ref.watch(skipProvider);
    final page = ref.watch(pageProvider);
    final query = ref.watch(searchProductNotifierProvider);

    final totalItems = ref.watch(totalItemsProvider);

    final products =
        ref.watch(fetchAllProductsProvider(skip: skip, query: query));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      log("ON CHANGE: $value");
                      ref
                          .read(searchProductNotifierProvider.notifier)
                          .setQuery(value);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.search,
                  size: 28,
                ),
              ],
            ),
            Expanded(
                child: products.when(
              skipLoadingOnRefresh: false,
              data: (data) {
                return ListView.builder(
                  itemCount: data["products"].length,
                  itemBuilder: (context, index) {
                    final product = data["products"][index] as ProductModel;
                    return ListTile(
                      title: Text(
                        product.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          product.thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Chip(
                            label: Text(
                              product.category,
                              style: const TextStyle(color: Colors.white),
                            ),
                            labelPadding: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 2),
                            side: BorderSide.none,
                            color: const WidgetStatePropertyAll(Colors.blue),
                          ),
                        ],
                      ),
                      trailing: Text("\$${product.price}"),
                    );
                  },
                );
              },
              error: (error, stackTrace) => const Center(
                child: Text('Something went wrong'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            )),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_left),
                ),
                Text("$skip"),
                const SizedBox(
                  width: 3,
                ),
                const Text("of"),
                const SizedBox(
                  width: 3,
                ),
                Text("$limit"),
                const SizedBox(
                  width: 3,
                ),
                const Text("total"),
                const SizedBox(
                  width: 3,
                ),
                Text("$totalItems"),
                IconButton(
                  onPressed: () async {
                    ref.read(pageProvider.notifier).update((state) => page + 1);

                    final newSkip = skip + 10;

                    ref.read(skipProvider.notifier).update((state) => newSkip);

                    ref
                        .read(limitProvider.notifier)
                        .update((state) => 10 + newSkip - 1);

                    ref.read(fetchAllProductsProvider(skip: newSkip).future);
                  },
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("page"),
                const SizedBox(
                  width: 3,
                ),
                Text("$page"),
                const SizedBox(
                  width: 3,
                ),
                const Text("of"),
                const SizedBox(
                  width: 3,
                ),
                Text("$totalPage"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
