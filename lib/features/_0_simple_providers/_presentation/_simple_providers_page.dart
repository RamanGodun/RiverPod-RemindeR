import 'package:flutter/material.dart';

import '../../../core/ui/widgets/custom_button.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'ui_4_provider__with_family_mod.dart';
import 'ui_4_provider_with_auto_disposed_and_family_mods.dart';
import 'ui_4_basic_provider.dart';
import 'ui_4_provider__with_auto_disposed_mod.dart';

class SimpleProvidersPage extends StatelessWidget {
  const SimpleProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'Welcome to Simple Providers!',
          TextType.titleSmall,
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
            CustomButton(
              title: 'Go to family provider',
              child: PageWithSimpleFamilyProvider(),
            ),
            CustomButton(
              title: 'to family autodisposed provider',
              child: PageWithAutoDisposedFamilyProvider(),
            ),
          ],
        ),
      ),
    );
  }
}
