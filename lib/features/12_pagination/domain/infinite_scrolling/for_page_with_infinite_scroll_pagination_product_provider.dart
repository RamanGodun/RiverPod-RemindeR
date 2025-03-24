import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/domain/models/product_model/product.dart';
import 'for_page_with_infinite_scroll_pagination_products_repository.dart';

part 'for_page_with_infinite_scroll_pagination_product_provider.g.dart';

@riverpod
FutureOr<Product> forPageWithInfiniteScrollPaginationGetProduct(
  Ref ref,
  int id,
) {
  ref.onDispose(() {
    debugPrint('product with $id disposed');
  });

  return ref
      .watch(forPageWithInfiniteScrollPaginationProductsRepositoryProvider)
      .getProduct(id);
}
