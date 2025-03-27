import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';
import '../../../core/domain/config/app_config.dart';
import '../../../core/presentation/widgets/text_widget.dart';
import '../domain/basic_provider/basic_provider_manual.dart' as manual;
import '../domain/basic_provider/basic_provider_gen.dart' as generated;

/// 📄 **PageWithSimpleKeepAliveProvider**
/// Displays data from a simple Provider that persists during the app lifecycle.
class PageWithSimpleKeepAliveProvider extends ConsumerWidget {
  const PageWithSimpleKeepAliveProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🔄 Choose provider source based on AppConfig
    final appBarText =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(generated.appBarTextWithGenProvider)
            : ref.watch(manual.appBarTextProviderManual);

    final bodyText =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(generated.bodyTextWithGenProvider)
            : ref.watch(manual.bodyTextProviderManual);

    return Scaffold(
      appBar: CustomAppBar(title: appBarText, isCenteredTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextWidget(
            bodyText,
            TextType.bodyLarge,
            isTextOnFewStrings: true,
          ),
        ),
      ),
    );
  }
}
