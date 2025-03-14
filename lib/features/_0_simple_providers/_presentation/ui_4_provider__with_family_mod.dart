import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/config/app_config.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';
import '../plus_family__mod/provider_with_family_mod_manual.dart' as manual;
import '../plus_family__mod/provider_with_family_mod_gen.dart' as generated;

class PageWithSimpleFamilyProvider extends ConsumerWidget {
  const PageWithSimpleFamilyProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      appBar: AppBar(
        title: TextWidget(
          helloFriend,
          TextType.titleSmall,
          isTextOnFewStrings: true,
        ),
      ),
      body: Center(
        child: TextWidget(
          helloDeveloper,
          TextType.bodyLarge,
          isTextOnFewStrings: true,
        ),
      ),
    );
  }
}

/*
 This  provider (with family mod) does not automatically dispose when no widget is using it.
 The `onDispose` callback will never be triggered unless you manually
 invalidate or refresh the provider.

 Use this provider when you want to retain the state throughout the entire
 lifecycle of the app or when the state should persist even after the widget
 that consumes it is no longer in use.

 However, if you need to refresh or manually dispose of this provider,
 you can call the `invalidate` or `refresh` methods on it through the `ref`.

 This is suitable when you need to store data or state that should be kept
 for the duration of the app's run, without being disposed automatically.
 */
