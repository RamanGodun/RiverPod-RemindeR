import 'package:flutter/material.dart';

import '../../../core/ui/widgets/custom_button.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'ui_for_basic_provider.dart';
import 'ui_4_auto_dispose_mod_provider.dart';

class SimpleProvidersPage extends StatelessWidget {
  const SimpleProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'Welcome to Simple Providers!',
          TextType.bodyLarge,
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            /// 🚀 **кнопка переходу до модифікатори**
            CustomButton(
              title: 'Go to keepAlive provider',
              child: PageWithSimpleKeepAliveProvider(),
            ),
            CustomButton(
              title: 'Go to autodisposed provider',
              child: PageWithSimpleAutoDisposedProvider(),
            ),
          ],
        ),
      ),
    );
  }
}
// SimpleAutoDisposeProviderPage