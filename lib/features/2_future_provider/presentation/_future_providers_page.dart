import 'package:flutter/material.dart';
import '../../../core/ui/widgets/custom_button.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'ui_4_future_provider_with_fam_ad_mod.dart';
import 'users_list_page.dart';

class FutureProvidersPage extends StatelessWidget {
  const FutureProvidersPage({super.key});

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
