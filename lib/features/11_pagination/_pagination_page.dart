import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/buttons/custom_button.dart';
import 'infinite_scrolling/pages/products_page.dart';

class ProvidersOptimizationPage extends StatelessWidget {
  const ProvidersOptimizationPage({super.key});

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
              title: 'to providers override ex1',
              child: ProductsPageWithPagination(),
            ),

            // CustomButton(
            //   title: 'to providers override ex2',
            //   child: Page4SecondExampleOfProvidersOverride(),
            // ),

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
