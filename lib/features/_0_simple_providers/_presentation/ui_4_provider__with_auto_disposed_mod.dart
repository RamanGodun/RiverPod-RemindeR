import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/config/app_config.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';
import '../plus_auto_dispose_mod/provider_with_auto_dispose_mod_manual.dart'
    as manual_auto;
import '../../../features/_0_simple_providers/plus_auto_dispose_mod/provider_with_auto_dispose_mod_gen.dart'
    as generated_auto;

class PageWithSimpleAutoDisposedProvider extends StatelessWidget {
  const PageWithSimpleAutoDisposedProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'AutoDispose Provider Page',
          TextType.titleSmall,
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
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

                return TextWidget(
                  autoDisposeVariable,
                  TextType.bodyLarge,
                  isTextOnFewStrings: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
 This provider (with auto dispose) mod is automatically created when needed
 and disposed as soon as no widget is using it.
! AutoDisposed Provider uses when there is no need of data cashing (when content of page doesn't change frequently/often )

 Use this provider for temporary data or state that
 does not need to persist throughout the entire app run.

 It is ideal for cases where you want to free up resources
 when the data is no longer in use, such as loading states,
 temporary views, or components with short lifecycles.

 When all consumers of this provider stop listening to it,
 the provider is disposed of, freeing any associated memory and resources.
 */
