import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';
import '../../../core/domain/config/app_config.dart';
import 'package:riverpod_reminder/core/presentation/widgets/text_widget.dart';
import '../domain/provider_plus_auto_dispose_mod/provider_with_auto_dispose_mod_manual.dart'
    as manual_auto;
import '../domain/provider_plus_auto_dispose_mod/provider_with_auto_dispose_mod_gen.dart'
    as generated_auto;

/// 📄 **[PageWithSimpleAutoDisposedProvider] Dynamically switches between manually written & code-generated provider.
/// Useful to compare code-generated & manual approaches with AutoDispose behavior.
class PageWithSimpleAutoDisposedProvider extends StatelessWidget {
  const PageWithSimpleAutoDisposedProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'provider with AutoDispose mod',
        isCenteredTitle: true,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            /// 🟢 **Consumer listens to AutoDispose Provider (manual/code-gen based on config)**
            Consumer(
              builder: (context, ref, child) {
                final autoDisposeVariable =
                    AppConfig.isUsingCodeGeneration
                        ? ref.watch(
                          generated_auto.autoDisposedModeWithSimpleGenProvider,
                        )
                        : ref.watch(
                          manual_auto.simpleManualProviderWithAutoDisposedMode,
                        );

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextWidget(
                    autoDisposeVariable,
                    TextType.bodyLarge,
                    isTextOnFewStrings: true,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
