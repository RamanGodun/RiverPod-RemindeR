import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/buttons/custom_button.dart';
import '../provider_scope_and_overlay/page_4_overlay_optimization.dart';

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
              title: 'to overlay optimization',
              child: PageToShowDependenceOfLocalAndGlobalContext(),
            ),

            // CustomButton(
            //   title: 'to products, cashed for 10/25 sec',
            //   child: Page4ProductsThatCashedFor10Sec(),
            // ),

            // CustomButton(
            //   title: 'to using Consumer widget page',
            //   child: PageToShowProductivityIncreasingWhenUseConsumerWidget(),
            // ),

            // CustomButton(
            //   title: 'to cascade providers',
            //   child: CascadeProvidersPage(),
            // ),
            /* CascadeProvidersPage
             */
          ],
        ),
      ),
    );
  }
}
