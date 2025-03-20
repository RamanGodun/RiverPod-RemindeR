/*
===============================
## PAGINATION with provider:
1. **Numbered Pagination**: 
   - Used to navigate to a specific page of data.
   - Useful when the user wants to jump directly to a certain page (e.g., page 5 of a list).
   - Data for each page is fetched and displayed accordingly.

2. **Infinite Scrolling**: 
   - Dynamically loads additional data as the user scrolls down the list.
   - Ideal for scenarios where the user expects seamless data loading without explicit navigation.
   - Fetches new data from the backend when the user reaches the end of the current list.

===============================

===============================
## Description How was app made

This application uses the DioProvider request distribution pattern, which is responsible for generating HTTP requests.
 The repository is an intermediate abstract layer between API and UI: it processes responses from DioProvider and converts them into Product models.
 The providers (getProductsProvider and getProductProvider) call repository methods to retrieve data, cache it, and provide reactivity.
 In UI logic (for example, ProductsPage), these providers are used to display data, supporting 

===============================

===============================

## Algorithm to implement Provider Observer

! repository file is NEXT:
"
part 'product_repository.g.dart';

const limit = 20;

class ProductRepository {
  final Dio dio;

  ProductRepository(this.dio);

  Future<List<Product>> getProducts(int page) async {
    try {
      final Response response = await dio.get(
        '/products',
        queryParameters: {
          'limit': limit,
          'skip': (page - 1) * limit,
        },
      );

      if (response.statusCode != 200) {
        throw 'Fail to fetch products';
      }

      final List productList = response.data['products'];

      final products = [
        for (final product in productList) Product.fromJson(product)
      ];

      return products;
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> getProduct(int id) async {
    try {
      final Response response = await dio.get('/products/$id');

      if (response.statusCode != 200) {
        throw 'Fail to fetch product with $id';
      }

      final product = Product.fromJson(response.data);

      return product;
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
ProductRepository productRepository(Ref ref) {
  return ProductRepository(ref.watch(dioProvider));
}
"

! Product and Products providers
both these providers - it's a reactive wrappers (work on principle "observe-and-react") around methods of repository 
their code is next:
"
part 'products_providers.g.dart';
@riverpod
FutureOr<List<Product>> getProducts(Ref ref, int page) async {
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
"

"
part 'product_providers.g.dart';

@riverpod
FutureOr<Product> getProduct(Ref ref, int id) {
  ref.onDispose(() {
    print('product with $id disposed');
  });

  return ref.watch(productRepositoryProvider).getProduct(id);
}
"


! Infinite scroll pagination example on ProductsPage
the code is NEXT:
"
class ProductsPageWithPagination extends ConsumerStatefulWidget {
  const ProductsPageWithPagination({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductsPageWithPaginationState();
}

class _ProductsPageWithPaginationState
    extends ConsumerState<ProductsPageWithPagination> {
  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchProducts(pageKey);
    });
  }

  Future<void> _fetchProducts(int pageKey) async {
    try {
      final newProducts =
          await ref.read(productRepositoryProvider).getProducts(pageKey);
      final isLastPage = newProducts.length < limit;

      if (isLastPage) {
        _pagingController.appendLastPage(newProducts);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newProducts, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Product List', TextType.titleSmall),
      ),
      body: RefreshIndicator(
        onRefresh: () async => _pagingController.refresh(),
        child: PagedListView<int, Product>.separated(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, product, index) {
              return GestureDetector(
                onTap: () => Helpers.pushTo(
                    context, ProductPage4ScrollPagination(id: product.id)),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    CircleAvatar(child: Text(product.id.toString())),
                    Expanded(
                      child: ListTile(
                        title: TextWidget(product.title, TextType.smallHeadline,
                            alignment: TextAlign.left),
                        subtitle: TextWidget(product.brand, TextType.body,
                            alignment: TextAlign.left),
                      ),
                    ),
                  ],
                ),
              );
            },
            noMoreItemsIndicatorBuilder: (context) => const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: TextWidget('No more products!', TextType.error),
              ),
            ),
            firstPageErrorIndicatorBuilder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    const TextWidget(
                        'Something went wrong', TextType.smallHeadline),
                    const SizedBox(height: 20),
                    TextWidget('${_pagingController.error}', TextType.error),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () => _pagingController.refresh(),
                      child: const TextWidget('Try Again!', TextType.button),
                    )
                  ],
                ),
              );
            },
          ),
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
"



===============================
 */
