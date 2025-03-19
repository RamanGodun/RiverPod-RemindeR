import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'product_presentation.dart';
import 'providers.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(getProductsProvider);

    return Scaffold(
      appBar: AppBar(title: const TextWidget('Products', TextType.titleSmall)),
      body: productList.when(
        data: (products) {
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
                      ProductPage(productId: product.id),
                    ),
                child: ListTile(
                  leading: CircleAvatar(
                    child: TextWidget('${product.id}', TextType.titleSmall),
                  ),
                  title: TextWidget(product.title, TextType.titleMedium),
                ),
              );
            },
          );
        },
        error: (e, st) => AppMiniWidgets(MWType.error, error: e.toString()),
        loading: () => const AppMiniWidgets(MWType.loading),
      ),
    );
  }
}
