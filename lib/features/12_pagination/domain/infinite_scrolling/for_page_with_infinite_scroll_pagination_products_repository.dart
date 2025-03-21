import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/domain/models/product_model/product.dart';
import '../../../../../core/domain/state/dio_and_retrofit/dio_providers/dummy_api/dummy_api_dio_provider.dart';

part 'for_page_with_infinite_scroll_pagination_products_repository.g.dart';

const limit = 20;

class ForPageWithInfinitePaginationProductsRepository {
  final Dio dio;

  ForPageWithInfinitePaginationProductsRepository(this.dio);

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
ForPageWithInfinitePaginationProductsRepository
forPageWithInfiniteScrollPaginationProductsRepository(Ref ref) {
  return ForPageWithInfinitePaginationProductsRepository(
    ref.watch(dummyApiDioProvider),
  );
}
