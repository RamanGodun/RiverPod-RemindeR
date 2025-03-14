import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/config/app_config.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';

// ✅ Імпортуємо обидва варіанти провайдерів
import '../plus_family_and_auto_dispose_mod/provider_with_auto_disposed_and_family_mods.dart'
    as manual;
import '../plus_family_and_auto_dispose_mod/provider_with_auto_disposed_and_family_mods_gen.dart'
    as generated;

class PageWithAutoDisposedFamilyProvider extends ConsumerWidget {
  const PageWithAutoDisposedFamilyProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 🔥 **Вибираємо провайдер залежно від `AppConfig.isUsingCodeGeneration`**
    final helloRoman =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(
              generated.autoDisposeFamilyProvider(customizedText: 'This text'),
            )
            : ref.watch(manual.autoDisposeFamilyProvider('This text'));

    final helloGodun =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(
              generated.autoDisposeFamilyProvider(
                customizedText: 'As well as this text also',
              ),
            )
            : ref.watch(
              manual.autoDisposeFamilyProvider('As well as this text also'),
            );

    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          helloRoman,
          TextType.titleSmall,
          isTextOnFewStrings: true,
        ),
      ),
      body: Center(
        child: TextWidget(
          helloGodun,
          TextType.bodyLarge,
          isTextOnFewStrings: true,
        ),
      ),
    );
  }
}



/*
 This provider is created on demand (when it is watched in the UI)
 and automatically disposed when no widget is using it.

 If we use this provider with different arguments on the same page,
 it will create and dispose separate instances for each argument.

 However, if we call this provider multiple times on the same page
 with the same argument, it will create and dispose the instance only once.

 It's important to override `hashCode` and the equality operator (`==`)
 when working with family providers that use complex objects as keys.
 This can be easily achieved with the help of libraries like `freezed`, `equatable`, or `tuple`.
 Failure to do so may result in unintended behavior or memory leaks.

 Use this provider when you do not need to persist the state
 throughout the entire lifecycle of the app.
 */


