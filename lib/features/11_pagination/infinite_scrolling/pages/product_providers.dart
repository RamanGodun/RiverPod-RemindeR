import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/domain/models/product.dart';
import '../repositories/product_repository.dart';

part 'product_providers.g.dart';

@riverpod
FutureOr<Product> getProduct(Ref ref, int id) {
  ref.onDispose(() {
    print('product with $id disposed');
  });

  return ref.watch(productRepositoryProvider).getProduct(id);
}
