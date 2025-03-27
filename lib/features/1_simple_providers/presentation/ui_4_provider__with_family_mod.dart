import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';
import '../../../core/domain/config/app_config.dart';
import 'package:riverpod_reminder/core/presentation/widgets/text_widget.dart';
import '../domain/provider_plus_family__mod/provider_with_family_mod_manual.dart'
    as manual;
import '../domain/provider_plus_family__mod/provider_with_family_mod_gen.dart'
    as generated;

/// 📄 Page demonstrating usage of Provider with Family modifier.
class PageWithSimpleFamilyProvider extends ConsumerWidget {
  const PageWithSimpleFamilyProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Dynamically selecting provider based on AppConfig (codegen or manual)
    final helloFriend =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(
              generated.simpleProviderWithFamilyModGenProvider('Friend'),
            )
            : ref.watch(manual.simpleProviderWithFamilyModManual('Friend'));

    final helloDeveloper =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(
              generated.simpleProviderWithFamilyModGenProvider('Developer'),
            )
            : ref.watch(manual.simpleProviderWithFamilyModManual('Developer'));

    return Scaffold(
      appBar: const CustomAppBar(title: 'Provider with family mod'),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            // Displays text from provider instance with parameter 'Friend'
            TextWidget(
              helloFriend,
              TextType.titleSmall,
              isTextOnFewStrings: true,
            ),

            const SizedBox(height: 50),

            // Displays text from provider instance with parameter 'Developer'
            TextWidget(
              helloDeveloper,
              TextType.bodyLarge,
              isTextOnFewStrings: true,
            ),
          ],
        ),
      ),
    );
  }
}
