import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/app_constants/app_constants.dart';
import '../../../core/domain/app_constants/app_strings.dart';
import '../../../core/domain/utils_and_services/dialogs_service.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/state_provider__with_auto_disposed_mod.dart';

class Page4StateProviderWithAutoDisposedMode extends ConsumerWidget {
  const Page4StateProviderWithAutoDisposedMode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 🎯 Listens for counter changes and shows a warning dialog for specific values
    _showDialogWhenCounterIsSpecific(ref, context);

    /// 🔄 Rebuilds UI when the counter changes
    final value = ref.watch(clickedTimeWithAutoDisposedModeSimpleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          AppStrings.counterScreenTitle,
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
              AppStrings.counterInstruction,
              TextType.titleLarge,
              isTextOnFewStrings: true,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 78.0),
              child: TextWidget(
                '$value ${value == 1 ? AppStrings.clickSingular : AppStrings.clickPlural}',
                TextType.headlineMedium,
                color: AppConstants.errorColor,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// ➕ Increments the counter
          ref
              .read(counterProviderWithAutoDisposedMod.notifier)
              .update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  /// 🚨 Listen and show warning dialogs at specific counts
  void _showDialogWhenCounterIsSpecific(WidgetRef ref, BuildContext context) {
    final warnings = AppStrings.counterWarningMessages;

    ref.listen<int>(counterProviderWithAutoDisposedMod, (previous, next) {
      if (warnings.containsKey(next)) {
        DialogService.showAlertErrorDialog(context, warnings[next]!);
      }
    });
  }
}
