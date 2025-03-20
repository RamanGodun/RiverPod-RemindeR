import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/buttons/custom_button.dart';
import '../subtree optimization/example1_page.dart';
import '../subtree optimization/example2_page.dart';

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
            CustomButton(title: 'without optimization', child: Example1Page()),

            CustomButton(title: 'with optimization', child: Example2Page()),

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
