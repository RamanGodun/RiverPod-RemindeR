import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/with_dio_async_keep_alive_10_sec_providers.dart';
import 'page_4_product.dart';

class Page4ProductsThatCashedFor10Sec extends ConsumerWidget {
  const Page4ProductsThatCashedFor10Sec({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(getProductsListThatCashedFor10SecProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Products'),
      body: productList.when(
        ///
        data: (products) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 26),
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
