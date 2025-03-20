import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../core/domain/models/product.dart';
import '../../../../core/domain/utils_and_services/helpers.dart';
import '../../../../core/ui/widgets/text_widget.dart';
import '../repositories/product_repository.dart';
import 'product_page.dart';

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
    _pagingController = PagingController<int, Product>(
      getNextPageKey: (state) {
        final keys = state.keys;
        if (keys == null || keys.isEmpty) return 1;
        return keys.last + 1;
      },
      fetchPage: (pageKey) async {
        try {
          final newProducts = await ref
              .read(productRepositoryProvider)
              .getProducts(pageKey);
          return newProducts;
        } catch (error) {
          throw Exception('Error fetching products: $error');
        }
      },
    );
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
        child: PagingListener<int, Product>(
          controller: _pagingController,
          builder: (context, state, fetchNextPage) {
            return PagedListView<int, Product>.separated(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate<Product>(
                itemBuilder: (context, product, index) {
                  return GestureDetector(
                    onTap:
                        () => Helpers.pushTo(
                          context,
                          ProductPage4ScrollPagination(id: product.id),
                        ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        CircleAvatar(child: Text(product.id.toString())),
                        Expanded(
                          child: ListTile(
                            title: TextWidget(
                              product.title,
                              TextType.headlineSmall,
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
                noMoreItemsIndicatorBuilder:
                    (context) => const Center(
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
                          'Something went wrong',
                          TextType.headlineSmall,
                        ),
                        const SizedBox(height: 20),
                        TextWidget('${state.error}', TextType.error),
                        const SizedBox(height: 20),
                        OutlinedButton(
                          onPressed: () => _pagingController.refresh(),
                          child: const TextWidget(
                            'Try Again!',
                            TextType.button,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              separatorBuilder: (context, index) {
                return const Divider();
              },
            );
          },
        ),
      ),
    );
  }
}
