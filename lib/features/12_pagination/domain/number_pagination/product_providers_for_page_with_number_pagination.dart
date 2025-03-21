import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../../core/domain/models/product_model/product.dart';
import 'repositories/product_repository_for_page_with_number_pagination.dart';

part 'product_providers_for_page_with_number_pagination.g.dart';

@riverpod
FutureOr<Product> forPageWithNumberPaginationGetProduct(Ref ref, int id) {
  ref.onDispose(() {
    print('product with $id disposed');
  });

  return ref.watch(productRepositoryProvider).getProduct(id);
}
