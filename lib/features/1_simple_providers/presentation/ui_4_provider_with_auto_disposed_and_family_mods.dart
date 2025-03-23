import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/config/app_config.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';

// ✅ Import both manual & generated providers
import '../domain/provider_plus_family_and_auto_dispose_mod/provider_with_auto_disposed_and_family_mods_manual.dart'
    as manual;
import '../domain/provider_plus_family_and_auto_dispose_mod/provider_with_auto_disposed_and_family_mods_gen.dart'
    as generated;

/// 📄 Demonstrates AutoDispose Family Provider (manual & generated versions)
class PageWithAutoDisposedFamilyProvider extends ConsumerWidget {
  const PageWithAutoDisposedFamilyProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Select provider based on AppConfig
    final helloRoman =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(generated.autoDisposeFamilyProvider('This text'))
            : ref.watch(manual.autoDisposeFamilyProvider('This text'));

    final helloGodun =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(
              generated.autoDisposeFamilyProvider('As well as this text also'),
            )
            : ref.watch(
              manual.autoDisposeFamilyProvider('As well as this text also'),
            );

    return Scaffold(
      appBar: const CustomAppBar(title: 'AutoDispose Family Provider'),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            ///
            TextWidget(
              helloRoman,
              TextType.titleSmall,
              isTextOnFewStrings: true,
            ),

            const SizedBox(height: 50),

            TextWidget(
              helloGodun,
              TextType.bodyLarge,
              isTextOnFewStrings: true,
            ),

            ///
          ],
        ),
      ),
    );
  }
}
