import 'package:flutter/material.dart';
import '../../../core/ui/widgets/custom_button.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'ui_4_basic_state_provider.dart';
import 'ui_4_state_provider__with_auto_disposed_mod.dart';
import 'ui_4_state_provider__with_family_mod.dart';
import 'ui_4_state_provider_with_auto_disposed_family_mod.dart';

class StateProvidersPage extends StatelessWidget {
  const StateProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'Welcome to State Providers!',
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
              title: 'Go to basic provider',
              child: Page4BasicStateProvider(),
            ),
            CustomButton(
              title: 'Go to autodisposed mod',
              child: Page4StateProviderWithAutoDisposedMode(),
            ),
            CustomButton(
              title: 'Go to family mod',
              child: Page4StateProviderWithFamilyMod(),
            ),
            CustomButton(
              title: 'Go to family autodisposed mod',
              child: Page4StateProviderWithAutoDisposedFamilyMod(),
            ),
          ],
        ),
      ),
    );
  }
}
