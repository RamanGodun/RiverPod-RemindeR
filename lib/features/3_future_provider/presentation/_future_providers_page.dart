import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/buttons/custom_button.dart';
import 'ui_4_future_provider_with_fam_ad_mod.dart';
import 'users_list_page.dart';

class FutureProvidersPage extends StatelessWidget {
  const FutureProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Welcome to State Providers!'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            /// 🚀 **buttons transfer to mods pages
            CustomButton(title: 'to Users list page', child: UserListPage()),
            CustomButton(
              title: 'to family autoDisposed mod',
              child: FutureProviderWithFamilyAutoDisposeMode(),
            ),
          ],
        ),
      ),
    );
  }
}
