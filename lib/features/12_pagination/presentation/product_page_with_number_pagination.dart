import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/number_pagination/product_providers_for_page_with_number_pagination.dart';

class ProductPageWithNumberPagination extends ConsumerWidget {
  final int id;
  const ProductPageWithNumberPagination({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singleProduct = ref.watch(
      forPageWithNumberPaginationGetProductProvider(id),
    );
    final colorScheme = Helpers.getColorScheme(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Product Details'),
      body: singleProduct.when(
        data: (product) {
          return ListView(
            shrinkWrap: true,
            key: const PageStorageKey('numberPagination'),
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            children: [
              Row(
                spacing: 10,
                children: [
                  CircleAvatar(
                    backgroundColor: colorScheme.secondary,
                    child: TextWidget(id.toString(), TextType.titleMedium),
                  ),

                  Expanded(
                    child: TextWidget(product.title, TextType.headlineSmall),
                  ),
                ],
              ),
              const Divider(),

              /// Product details in bullets
              BulletedList(
                bullet: const Icon(Icons.check, color: Colors.green),
                listItems: [
                  'brand: ${product.brand}',
                  'price: \$${product.price}',
                  'discount(%): ${product.discountPercentage}',
                  'stock: ${product.stock}',
                  'category: ${product.category}',
                  'description: ${product.description}',
                ],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Divider(),

              /// Product image
              SizedBox(
                width: double.infinity,
                child: Image.network(product.thumbnail, fit: BoxFit.cover),
              ),
            ],
          );
        },

        /// Error and loading states
        error: (e, st) => AppMiniWidgets(MWType.error, error: e),
        loading: () => const AppMiniWidgets(MWType.loading),
      ),
    );
  }
}
