import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/helpers.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';
import '../domain/infinite_scrolling/for_page_with_infinite_scroll_pagination_product_provider.dart';

class ProductPageWithInfiniteScrollPagination extends ConsumerWidget {
  final int id;
  const ProductPageWithInfiniteScrollPagination({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singleProduct = ref.watch(
      forPageWithInfiniteScrollPaginationGetProductProvider(id),
    );
    final colorScheme = Helpers.getColorScheme(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Product Detail'),
      body: singleProduct.when(
        ///
        data: (product) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: colorScheme.secondary,
                    child: TextWidget(
                      id.toString(),
                      TextType.titleMedium,
                      color: colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextWidget(
                      product.title,
                      TextType.titleLarge,
                      alignment: TextAlign.start,
                      isTextOnFewStrings: true,
                    ),
                  ),
                ],
              ),

              ///
              const Divider(),
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

              ///
              SizedBox(
                width: double.infinity,
                child: Image.network(product.thumbnail, fit: BoxFit.cover),
              ),
            ],
          );
        },

        ///
        error:
            (e, st) => Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextWidget(e.toString(), TextType.headlineMedium),
              ),
            ),

        ///
        loading:
            () => const Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
