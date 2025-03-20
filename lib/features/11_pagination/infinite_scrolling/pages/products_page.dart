import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/domain/utils_and_services/helpers.dart';
import '../../../../core/ui/widgets/text_widget.dart';
import '../../domain/models/product.dart';
import '../repositories/product_repository.dart';

class ProductsPageWithPagination extends ConsumerStatefulWidget {
  const ProductsPageWithPagination({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductsPageWithPaginationState();
}

class _ProductsPageWithPaginationState
    extends ConsumerState<ProductsPageWithPagination> {
  final PagingController<int, Product> _pagingController = PagingController(
    firstPageKey: 1,
  );

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchProducts(pageKey);
    });
  }

  Future<void> _fetchProducts(int pageKey) async {
    try {
      final newProducts = await ref
          .read(productRepositoryProvider)
          .getProducts(pageKey);
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
                    TextWidget('${_pagingController.error}', TextType.error),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () => _pagingController.refresh(),
                      child: const TextWidget('Try Again!', TextType.button),
                    ),
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
