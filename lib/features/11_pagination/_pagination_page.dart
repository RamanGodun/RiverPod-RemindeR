import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/buttons/custom_button.dart';
import 'infinite_scrolling/pages/products_page.dart';
import 'number_pagination/pages/products/products_page.dart';

class PaginationPage extends StatelessWidget {
  const PaginationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Providers lifecycle page'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            /// 🚀 **кнопка переходу до модифікатори**
            CustomButton(
              title: 'to ProductsPageWithPagination',
              child: ProductsPageWithPagination(),
            ),

            CustomButton(
              title: 'to ProductsPageWithNumberPagination',
              child: ProductsPageWithNumberPagination(),
            ),

            // CustomButton(
            //   title: 'to using Consumer widget page',
            //   child: PageWithOptimizedLocalStatesForItems(),
            // ),

            ///
          ],
        ),
      ),
    );
  }
}
