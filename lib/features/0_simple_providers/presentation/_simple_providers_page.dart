import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';

import '../../../core/ui/widgets/buttons/custom_button.dart';
import 'ui_4_provider__with_family_mod.dart';
import 'ui_4_provider_with_auto_disposed_and_family_mods.dart';
import 'ui_4_basic_provider.dart';
import 'ui_4_provider__with_auto_disposed_mod.dart';

class SimpleProvidersPage extends StatelessWidget {
  const SimpleProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Welcome to Simple Providers!'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            /// 🚀 **кнопка переходу до модифікатори**
            CustomButton(
              title: 'Go to basic provider',
              child: PageWithSimpleKeepAliveProvider(),
            ),
            CustomButton(
              title: 'Go to autodisposed mod',
              child: PageWithSimpleAutoDisposedProvider(),
            ),
            CustomButton(
              title: 'Go to family mod',
              child: PageWithSimpleFamilyProvider(),
            ),
            CustomButton(
              title: 'Go to family autodisposed mod',
              child: PageWithAutoDisposedFamilyProvider(),
            ),
          ],
        ),
      ),
    );
  }
}
