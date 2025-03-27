import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';
import '../../../core/presentation/widgets/buttons/custom_button.dart';
import 'page_4_products_cashed_for_10_sec.dart';
import 'page_4_counter_cashed_for_10_sec_provider.dart';
import 'page_with_using_consumer_widget.dart';
import 'page_4_cascade_providers.dart';

class Page4ProvidersLifecycle extends StatelessWidget {
  const Page4ProvidersLifecycle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Providers lifecycle page'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            ///
            CustomButton(
              title: 'to counter, cashed for 10 sec',
              child: Page4CounterOnSyncKeepAliveFor10SecProvider(),
            ),

            CustomButton(
              title: 'to products, cashed for 10/25 sec',
              child: Page4ProductsThatCashedFor10Sec(),
            ),

            CustomButton(
              title: 'to using Consumer widget page',
              child: PageToShowProductivityIncreasingWhenUseConsumerWidget(),
            ),

            CustomButton(
              title: 'to cascade providers',
              child: CascadeProvidersPage(),
            ),
            /* CascadeProvidersPage
             */
          ],
        ),
      ),
    );
  }
}
