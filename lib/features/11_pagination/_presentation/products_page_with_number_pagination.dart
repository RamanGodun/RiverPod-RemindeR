import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_paginator/number_paginator.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/number_pagination/products_providers_for_page_with_number_pagination.dart';
import '../domain/number_pagination/repositories/product_repository_for_page_with_number_pagination.dart';
import 'product_page_with_number_pagination.dart';

class ProductsPageWithNumberPagination extends ConsumerStatefulWidget {
  const ProductsPageWithNumberPagination({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductsPageState();
}

class _ProductsPageState
    extends ConsumerState<ProductsPageWithNumberPagination> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    final productList = ref.watch(
      forPageWithNumberPaginationGetProductsProvider(page),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: productList.when(
          data: (products) {
            print('from page: products');
            return ListView.separated(
              itemCount: products.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];

                return GestureDetector(
                  onTap:
                      () => Helpers.pushTo(
                        context,
                        ProductPageWithNumberPagination(id: product.id),
                      ),
                  child: ListTile(
                    title: TextWidget(product.title, TextType.titleMedium),
                    subtitle: TextWidget(product.brand, TextType.titleSmall),
                  ),
                );
              },
            );
          },
          error: (e, st) => AppMiniWidgets(MWType.error, error: e),
          loading: () => const AppMiniWidgets(MWType.loading),
        ),
        bottomNavigationBar:
            totalProducts == 0 && totalPages == 1
                ? const SizedBox.shrink()
                : Card(
                  margin: EdgeInsets.zero,
                  elevation: 4,
                  child: NumberPaginator(
                    numberPages: totalPages,
                    onPageChange: (int index) {
                      setState(() {
                        page = index + 1;
                      });
                    },
                  ),
                ),
        /*
     
         */
      ),
    );
  }
}
