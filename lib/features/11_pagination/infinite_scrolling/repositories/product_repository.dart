import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/product.dart';
import 'dio_provider.dart';

part 'product_repository.g.dart';

const limit = 20;

class ProductRepository {
  final Dio dio;

  ProductRepository(this.dio);

  Future<List<Product>> getProducts(int page) async {
    try {
      final Response response = await dio.get(
        '/products',
        queryParameters: {'limit': limit, 'skip': (page - 1) * limit},
      );

      if (response.statusCode == null || response.statusCode! >= 400) {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }

      final List productList = response.data['products'] ?? [];

      return productList.map((product) => Product.fromJson(product)).toList();
    } catch (e, stackTrace) {
      debugPrint('API error: $e');
      debugPrint('$stackTrace');
      rethrow;
    }
  }

  Future<Product> getProduct(int id) async {
    try {
      final Response response = await dio.get('/products/$id');

      if (response.statusCode == null || response.statusCode! >= 400) {
        throw Exception('Failed to fetch product with id $id');
      }

      return Product.fromJson(response.data);
    } catch (e, stackTrace) {
      debugPrint('API error: $e');
      debugPrint('$stackTrace');
      rethrow;
    }
  }
}

@riverpod
ProductRepository productRepository(Ref ref) {
  return ProductRepository(ref.watch(dioProvider));
}
