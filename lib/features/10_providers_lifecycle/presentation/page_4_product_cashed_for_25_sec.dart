import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/presentation/widgets/mini_widgets.dart';
import '../../../core/presentation/widgets/text_widget.dart';
import '../domain/providers_cashed_for_10_or_25_sec.dart';

class ProductPage extends ConsumerWidget {
  final int productId;
  const ProductPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singleProduct = ref.watch(
      getProductDetailsThatCashedFor25SecProvider(productId: productId),
    );

    return Scaffold(
      appBar: const CustomAppBar(title: 'Product, cashed for 25 sec'),

      ///
      body: singleProduct.when(
        data:
            (product) => ListView(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          Helpers.getColorScheme(context).secondary,
                      child: TextWidget(
                        productId.toString(),
                        TextType.headlineMedium,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextWidget(product.title, TextType.headlineMedium),
                    ),
                  ],
                ),
                const Divider(),

                ///
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
                  style: Helpers.getTextTheme(context).titleSmall,
                ),
                const Divider(),
                SizedBox(
                  width: double.infinity,
                  child: Image.network(product.thumbnail, fit: BoxFit.cover),
                ),
              ],
            ),

        ///
        error: (e, st) => AppMiniWidgets(MWType.error, error: e.toString()),

        ///
        loading: () => const AppMiniWidgets(MWType.loading),
      ),
    );
  }
}
