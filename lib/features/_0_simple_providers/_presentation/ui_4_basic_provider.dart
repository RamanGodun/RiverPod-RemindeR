import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/config/app_config.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';
import '../basic_provider/basic_provider_manual.dart'
    as manual;
import '../../../features/_0_simple_providers/basic_provider/basic_provider_gen.dart'
    as generated;

class PageWithSimpleKeepAliveProvider extends ConsumerWidget {
  const PageWithSimpleKeepAliveProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 🔥 **Вибираємо провайдер залежно від `AppConfig.isUsingCodeGeneration`**
    final appBarText =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(generated.appBarTextWithGenProvider)
            : ref.watch(manual.appBarTextProviderManual);

    final bodyText =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(generated.bodyTextWithGenProvider)
            : ref.watch(manual.bodyTextProviderManual);

    return Scaffold(
      appBar: AppBar(title: TextWidget(appBarText, TextType.bodyLarge)),
      body: Center(
        child: TextWidget(
          bodyText,
          TextType.bodyLarge,
          isTextOnFewStrings: true,
        ),
      ),
    );
  }
}

/*
 This provider (simple keep alive Provider) does not dispose automatically.
 The `onDispose` callback is never triggered because
 the provider stays in memory throughout the entire app run.

 Use this type of provider when you need to retain the state
 or data for the entire duration of the app lifecycle.

 This is suitable for global states or configurations that
 should persist as long as the app is running.

 If you want to manually dispose or refresh this provider,
 you can call `invalidate` or `refresh` through the `ref` object.
 */
