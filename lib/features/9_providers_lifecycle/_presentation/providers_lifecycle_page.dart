import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/buttons/custom_button.dart';
import '../async_keep_alive_10_or_25_sec_with_dio/presentation/_products_page.dart';
import '../async_keep_alive_10_sec_provider/_page_4_counter_on_sync_keep_alive_for_10_sec_provider.dart';

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
            /// 🚀 **кнопка переходу до модифікатори**
            CustomButton(
              title: 'to counter, cashed for 10 sec',
              child: Page4CounterOnSyncKeepAliveFor10SecProvider(),
            ),
            CustomButton(
              title: 'to products, cashed for 10/25 sec',
              child: Page4ProductsThatCashedFor10Sec(),
            ),
          ],
        ),
      ),
    );
  }
}
