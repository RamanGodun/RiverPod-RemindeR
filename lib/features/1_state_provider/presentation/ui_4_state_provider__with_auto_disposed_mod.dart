import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/app_constants/app_constants.dart';
import '../../../core/domain/utils_and_services/dialogs_service.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/state_provider__with_auto_disposed_mod.dart';

class Page4StateProviderWithAutoDisposedMode extends ConsumerWidget {
  const Page4StateProviderWithAutoDisposedMode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 🎯 **Listens for counter changes and shows a warning dialog for specific values**
    _showDialogWhenCounterIsEqualTo245(ref, context);

    /// 🔄 **Rebuilds UI when the counter changes**
    final value = ref.watch(clickedTimeWithAutoDisposedModeSimpleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'using StateProvider \nwith AutoDisposed mode',
          TextType.titleSmall,
          isTextOnFewStrings: true,
        ),
      ),
      body: Center(
        child: Column(
          spacing: 35,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextWidget(
              'Dude, nice 😎, \nyou\'ve already clicked:',
              TextType.titleLarge,
              isTextOnFewStrings: true,
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 78.0),
              child: TextWidget(
                '$value time${value == 1 ? '' : 's'}',
                TextType.headlineMedium,
                color: AppConstants.errorColor,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// ➕ **Increments the counter using `
          ref
              .read(counterProviderWithAutoDisposedMod.notifier)
              .update((state) => state + 1);

          /* 🛠 ALTERNATIVE SYNTAX: Directly modifying the state (less clean)
          ref.read(autoDisposedCounterProvider.notifier).state += 1;
          */
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  /// 🚨 **Listens to `counterProviderWithAutoDisposedMod` and shows an alert dialog at specific thresholds**
  void _showDialogWhenCounterIsEqualTo245(WidgetRef ref, BuildContext context) {
    const warningMessages = {
      2: "Whoa! You've clicked 2 times! Easy there, champ! 🏆",
      4: "Okay, 4 clicks... are you trying to break something?! 🤨",
      5: "🚨 ALERT! 5 clicks detected! Authorities have been notified! 🚔😂",
    };

    ref.listen<int>(counterProviderWithAutoDisposedMod, (previous, next) {
      if (warningMessages.containsKey(next)) {
        DialogService.showAlertErrorDialog(context, warningMessages[next]!);
      }
    });
  }
}
