import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/domain/models/product_model/product.dart';
import '../../../core/domain/providers/dio_and_retrofit/dio_providers/dummy_api/dummy_api_dio_provider.dart';

part 'with_dio_async_keep_alive_10_sec_providers.g.dart';

@riverpod
FutureOr<List<Product>> getProductsListThatCashedFor10Sec(Ref ref) async {
  final cancelToken = CancelToken();
  Timer? timer;

  debugPrint('[getProductsProvider] initialized');
  ref.onAddListener(() {
    debugPrint('[getProductsProvider] listener added');
  });
  ref.onRemoveListener(() {
    debugPrint('[getProductsProvider] listener removed');
  });
  ref.onCancel(() {
    debugPrint('[getProductsProvider] cancelled');
  });
  ref.onResume(() {
    debugPrint('[getProductsProvider] resumed, timer cancelled');
    timer?.cancel();
  });
  ref.onDispose(() {
    debugPrint(
      '[getProductsProvider] disposed, token cancelled, timer cancelled',
    );
    timer?.cancel();
    cancelToken.cancel();
  });

  /* 
   * when user cancel entering the page BEFORE getting the response,
   * app backs but requested data are obtained "behind the scenes"
   * DISPOSE method are NOT called (!)
   */
  final keepAliveLink = ref.keepAlive();

  final response = await ref
      .watch(dummyApiDioProvider)
      .get('/products', cancelToken: cancelToken);

  ref.onCancel(() {
    print('[getProductsProvider] cancelled, timer started');
    timer = Timer(const Duration(seconds: 10), () {
      keepAliveLink.close();
    });
  });

  /* 
   * Getting products data 
   */
  final List productList = response.data['products'];
  debugPrint(productList[0].toString());
  final products = [
    for (final product in productList) Product.fromJson(product),
  ];
  return products;
}

@riverpod
FutureOr<Product> getProductDetailsThatCashedFor25Sec(
  Ref ref, {
  required int productId,
}) async {
  final cancelToken = CancelToken();
  Timer? timer;

  debugPrint('[getProductProvider($productId)] initialized');
  ref.onAddListener(() {
    debugPrint('[getProductProvider($productId)] listener added');
  });
  ref.onRemoveListener(() {
    debugPrint('[getProductProvider($productId)] listener removed');
  });
  ref.onCancel(() {
    debugPrint(
      '[getProductWith25SecCache($productId)] cancelled, timer started',
    );
  });
  ref.onResume(() {
    debugPrint('[getProductProvider($productId)] resumed');
    timer?.cancel();
  });
  ref.onDispose(() {
    debugPrint('[getProductProvider($productId)] disposed');
    timer?.cancel();
    cancelToken.cancel();
  });

  /*
   *  when keepAliveLink is after response and user cancel entering the page BEFORE getting the response,
   *  app backs but requested data are NOT obtained "behind the scenes" and DISPOSE method are called (!)
   */
  final response = await ref
      .watch(dummyApiDioProvider)
      .get('/products/$productId', cancelToken: cancelToken);
  final keepAliveLink = ref.keepAlive();

  ref.onCancel(() {
    debugPrint(
      '[getProductWith25SecCache($productId)] cancelled, timer started',
    );
    timer = Timer(const Duration(seconds: 25), () {
      keepAliveLink.close();
    });
  });

  /*  Getting product data
   */
  final product = Product.fromJson(response.data);
  return product;
  //
}
