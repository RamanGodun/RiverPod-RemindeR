import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../../core/domain/models/product_model/product.dart';
import 'repositories/product_repository_for_page_with_number_pagination.dart';

part 'products_providers_for_page_with_number_pagination.g.dart';

@riverpod
FutureOr<List<Product>> forPageWithNumberPaginationGetProducts(Ref ref, int page) async {
  final cancelToken = CancelToken();
  Timer? timer;

  ref.onDispose(() {
    print('[getProducts($page)] disposed, timer canceled, token canceled');
    timer?.cancel();
    cancelToken.cancel();
  });

  ref.onCancel(() {
    print('[getProducts($page)] canceled');
  });

  ref.onResume(() {
    print('[getProducts($page)] resumed, timer canceled');
    timer?.cancel();
  });

  final products = await ref
      .watch(productRepositoryProvider)
      .getProducts(page, cancelToken: cancelToken);

  final keepAliveLink = ref.keepAlive();

  ref.onCancel(() {
    print('[getProducts($page)] cancelled, timer started');
    timer = Timer(const Duration(seconds: 10), () {
      keepAliveLink.close();
    });
  });

  print('from products provider: $products');
  return products;
}
