import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/app_constants/app_constants.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/dialogs_service.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/basic_state_provider.dart';

class Page4BasicStateProvider extends ConsumerWidget {
  const Page4BasicStateProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Call the method that listens for changes and shows a dialog if the counter equals 2,4,5
    _showDialogWhenCounterIsEqualTo245(ref, context);

    // Watch the value of clickedTimesProvider to rebuild the UI on state changes
    final value = ref.watch(clickedTimesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'on this page using \n Basic StateProvider',
          TextType.titleSmall,
        ),
      ),
      body: Center(
        child: Column(
          spacing: 30,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextWidget(
              'You are amazing🤩, \nyou\'ve already clicked:',
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: FloatingActionButton(
          // Increment the state of counterProvider using its Notifier
          onPressed: () => ref.read(counterProvider.notifier).state++,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  /*
   * 💬 Listens to the counterProvider and shows a dialog when the counter reaches 2,4,5
   * This approach prevents rebuilding the widget tree unnecessarily.
   */
  void _showDialogWhenCounterIsEqualTo245(WidgetRef ref, BuildContext context) {
    const warningMessages = {
      2: "Whoa! You've clicked 2 times! Easy there, champ! 🏆",
      4: "Okay, 4 clicks... are you trying to break something?! 🤨",
      5: "🚨 ALERT! 5 clicks detected! Authorities have been notified! 🚔😂",
    };

    ref.listen<int>(counterProvider, (previous, next) {
      if (warningMessages.containsKey(next)) {
        DialogService.showAlertErrorDialog(context, warningMessages[next]!);
      }
    });
  }
}
