import 'package:riverpod_app/src/data/product_model.dart';

List<ProductModel> products = [
  const ProductModel(
      id: 1,
      title: "iPhone 15 Pro",
      description: "New iphone with dynamic island",
      price: 13.99,
      rating: 4.9,
      category: "smartphone",
      thumbnail: ""),
  const ProductModel(
      id: 1,
      title: "iPhone 13 Pro",
      description: "New iphone",
      price: 9.99,
      rating: 4.7,
      category: "smartphone",
      thumbnail: ""),
  const ProductModel(
      id: 1,
      title: "iPhone 15",
      description: "New iphone with dynamic island",
      price: 12.99,
      rating: 4.8,
      category: "smartphone",
      thumbnail: ""),
];

String baseUrl = 'https://dummyjson.com';
