import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/buttons/custom_button.dart';
import 'ui_4_basic_state_provider.dart';
import 'ui_4_state_provider__with_auto_disposed_mod.dart';
import 'ui_4_state_provider__with_family_mod.dart';
import 'ui_4_state_provider_with_auto_disposed_family_mod.dart';

class StateProvidersPage extends StatelessWidget {
  const StateProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Welcome to State Providers!'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            ///
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
