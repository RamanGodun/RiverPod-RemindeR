import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/buttons/custom_button.dart';
import 'ui_4_activity_on_async_notifier_provider.dart';
import 'ui_4_counter_async_notifier_provider.dart';

class Page4AsyncNotifierProviders extends StatelessWidget {
  const Page4AsyncNotifierProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Async notifier providers'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            /// 🚀 **кнопка переходу до модифікатори**
            CustomButton(
              title: 'to activity page',
              child: ActivityPageOnAsyncNotifierProvider(),
            ),

            CustomButton(
              title: 'to counter page',
              child: Page4CounterOnAsyncNotifierProvider(),
            ),
          ],
        ),
      ),
    );
  }
}
