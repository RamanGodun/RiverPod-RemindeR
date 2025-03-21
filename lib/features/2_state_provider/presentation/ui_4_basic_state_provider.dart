import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/app_constants/app_constants.dart';
import 'package:riverpod_reminder/core/domain/app_constants/app_strings.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/dialogs_service.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/basic_state_provider.dart';

class Page4BasicStateProvider extends ConsumerWidget {
  const Page4BasicStateProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 💬 Listen for changes and show dialog when counter reaches specific values
    _showDialogWhenCounterSpecific(ref, context);

    /// Watch state changes for counter
    final value = ref.watch(clickedTimesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          AppStrings.basicStatePageTitle,
          TextType.titleSmall,
        ),
      ),
      body: Center(
        child: Column(
          spacing: 30,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextWidget(
              AppStrings.basicStateInstruction,
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: FloatingActionButton(
          /// ➕ Increment counter state
          onPressed: () => ref.read(counterProvider.notifier).state++,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  /// 🚨 Listen and show warning dialog at specific counts
  void _showDialogWhenCounterSpecific(WidgetRef ref, BuildContext context) {
    final warnings = AppStrings.counterWarningMessages;

    ref.listen<int>(counterProvider, (previous, next) {
      if (warnings.containsKey(next)) {
        DialogService.showAlertErrorDialog(context, warnings[next]!);
      }
    });
  }
}
