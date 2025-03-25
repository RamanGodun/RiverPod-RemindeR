import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/buttons/custom_button.dart';
import 'ui_4_enum_bss_activity_async_provider.dart';
import 'ui_4_sealed_bss_activity_async_provider.dart';

class AsyncProvidersPage extends StatelessWidget {
  const AsyncProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Async providers'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            ///
            CustomButton(
              title: 'to page on enum state-shape (SS)',
              child: Page4EnumBasedAsyncActivityProvider(),
            ),

            CustomButton(
              title: 'to page on sealed class SS',
              child: Page4SealedClassBasedAsyncActivityProvider(),
            ),
          ],
        ),
      ),
    );
  }
}
