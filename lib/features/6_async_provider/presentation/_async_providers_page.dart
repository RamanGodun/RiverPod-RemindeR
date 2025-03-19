import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../../core/ui/widgets/custom_button.dart';
import 'enum_async_activity_presentation.dart';
import 'sealed_async_activity_presentation.dart';

class AsyncProvidersPage extends StatelessWidget {
  const AsyncProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Notifier providers'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            /// 🚀 **кнопка переходу до модифікатори**
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
