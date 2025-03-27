import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/presentation/widgets/mini_widgets.dart';
import '../../../core/presentation/widgets/text_widget.dart';
import '../domain/providers_cashed_for_10_or_25_sec.dart';
import 'page_4_product_cashed_for_25_sec.dart';

class Page4ProductsThatCashedFor10Sec extends ConsumerWidget {
  const Page4ProductsThatCashedFor10Sec({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(getProductsListThatCashedFor10SecProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Products, cashed for 10 sec'),
      body: productList.when(
        ///
        data: (products) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: products.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final product = products[index];

              ///
              return GestureDetector(
                onTap:
                    () => Helpers.pushTo(
                      context,
                      ProductPage(productId: product.id),
                    ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Helpers.getColorScheme(context).secondary,
                    child: TextWidget('${product.id}', TextType.titleSmall),
                  ),
                  title: TextWidget(
                    product.title,
                    TextType.titleMedium,
                    alignment: TextAlign.start,
                  ),
                ),
              );
            },
          );
        },

        ///
        error: (e, st) => AppMiniWidgets(MWType.error, error: e.toString()),

        ///
        loading: () => const AppMiniWidgets(MWType.loading),
      ),
    );
  }
}
