import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_reminder/core/presentation/widgets/buttons/outlined.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';
import '../../../core/domain/models/product_model/product.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/presentation/widgets/text_widget.dart';
import '../domain/infinite_scrolling/for_page_with_infinite_scroll_pagination_products_repository.dart';
import 'product_page_4_infinite_scroll_pagination.dart';

class ProductsPageWithPagination extends ConsumerStatefulWidget {
  const ProductsPageWithPagination({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductsPageWithPaginationState();
}

class _ProductsPageWithPaginationState
    extends ConsumerState<ProductsPageWithPagination> {
  late final PagingController<int, Product> _pagingController;

  @override
  void initState() {
    super.initState();
    // Initializes the paging controller with logic for page key extraction and data fetching.
    _pagingController = PagingController<int, Product>(
      getNextPageKey: (state) {
        final keys = state.keys;
        if (keys == null || keys.isEmpty) return 1;
        return keys.last + 1;
      },
      // Fetches the next page of products using repository injected via Riverpod.
      fetchPage: (pageKey) async {
        try {
          final newProducts = await ref
              .read(
                forPageWithInfiniteScrollPaginationProductsRepositoryProvider,
              )
              .getProducts(pageKey);
          return newProducts;
        } catch (error) {
          throw Exception('Error fetching products: $error');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Helpers.getColorScheme(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Products List'),

      /// Pull-to-refresh behavior triggers pagination reset
      body: RefreshIndicator(
        onRefresh: () async => _pagingController.refresh(),
        // Listens to pagination state and builds UI accordingly
        child: PagingListener<int, Product>(
          controller: _pagingController,
          builder: (context, state, fetchNextPage) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PagedListView<int, Product>.separated(
                state: state,
                fetchNextPage: fetchNextPage,
                builderDelegate: PagedChildBuilderDelegate<Product>(
                  // Builds each product item tile
                  itemBuilder: (context, product, index) {
                    return GestureDetector(
                      onTap:
                          () => Helpers.pushTo(
                            context,
                            ProductPageWithInfiniteScrollPagination(
                              id: product.id,
                            ),
                          ),
                      child: Row(
                        children: [
                          ///
                          CircleAvatar(
                            backgroundColor: colorScheme.secondary,
                            child: TextWidget(
                              product.id.toString(),
                              TextType.titleLarge,
                              color: colorScheme.onPrimary,
                            ),
                          ),

                          ///
                          Expanded(
                            child: ListTile(
                              title: TextWidget(
                                product.title,
                                TextType.titleMedium,
                                alignment: TextAlign.left,
                              ),
                              subtitle: TextWidget(
                                product.brand,
                                TextType.bodyMedium,
                                alignment: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },

                  /// Shown when no more pages to load
                  noMoreItemsIndicatorBuilder:
                      (context) => const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: TextWidget(
                            'No more products!',
                            TextType.error,
                          ),
                        ),
                      ),

                  /// Shown when error occurs on the first page
                  firstPageErrorIndicatorBuilder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 30,
                      ),
                      child: Column(
                        children: [
                          const TextWidget(
                            'Something went wrong',
                            TextType.headlineSmall,
                          ),
                          const SizedBox(height: 20),
                          TextWidget('${state.error}', TextType.error),
                          const SizedBox(height: 20),
                          CustomOutlinedButton(
                            buttonText: 'Try Again!',
                            onPressed: () => _pagingController.refresh(),
                          ),

                          ///
                        ],
                      ),
                    );
                  },
                ),
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
