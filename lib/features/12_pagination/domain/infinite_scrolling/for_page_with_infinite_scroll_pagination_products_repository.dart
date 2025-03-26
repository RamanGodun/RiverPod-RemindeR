import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/domain/models/product_model/product.dart';
import '../../../../core/domain/providers/dio_and_retrofit/dio_providers/dummy_api/dummy_api_dio_provider.dart';

part 'for_page_with_infinite_scroll_pagination_products_repository.g.dart';

const limit = 20;

/// Repository responsible for fetching paginated products data from the API.
/// Utilizes Dio for making HTTP requests.
class ForPageWithInfinitePaginationProductsRepository {
  final Dio dio;

  ForPageWithInfinitePaginationProductsRepository(this.dio);

  /// Fetches a list of products for the given page.
  /// Applies pagination using `limit` and `skip`.
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

  /// Fetches detailed information about a single product by [id].
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

/// Riverpod provider that exposes [ForPageWithInfinitePaginationProductsRepository].
/// It injects the Dio instance from [dummyApiDioProvider].
@riverpod
ForPageWithInfinitePaginationProductsRepository
forPageWithInfiniteScrollPaginationProductsRepository(Ref ref) {
  return ForPageWithInfinitePaginationProductsRepository(
    ref.watch(dummyApiDioProvider),
  );
}
