import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/app_constants/app_constants.dart';
import '../../../core/domain/app_constants/app_strings.dart';
import '../../../core/domain/utils_and_services/dialogs_service.dart';
import '../../../core/ui/widgets/buttons/custom_floating_button.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/state_provider__with_auto_disposed_mod.dart';

class Page4StateProviderWithAutoDisposedMode extends ConsumerWidget {
  const Page4StateProviderWithAutoDisposedMode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _showDialogWhenCounterIsSpecific(ref, context);
    final value = ref.watch(clickedTimeWithAutoDisposedModeSimpleProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'State provider with AD mod'),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const TextWidget(
              AppStrings.counterScreenTitle,
              TextType.titleMedium,
              isTextOnFewStrings: true,
            ),
            const SizedBox(height: 15),
            const TextWidget(
              AppStrings.counterInstruction,
              TextType.titleLarge,
              isTextOnFewStrings: true,
            ),

            const SizedBox(height: 45),
            TextWidget(
              '$value ${value == 1 ? AppStrings.clickSingular : AppStrings.clickPlural}',
              TextType.headlineMedium,
              color: AppConstants.errorColor,
            ),
          ],
        ),
      ),

      ///
      floatingActionButton: CustomFloatingButton(
        onPressed:
            () =>
                ref
                    .read(withAutoDisposedModCounterProvider.notifier)
                    .increment(),
      ),
    );
  }

  /// 🚨 Listen and show warning dialogs at specific counts
  void _showDialogWhenCounterIsSpecific(WidgetRef ref, BuildContext context) {
    final warnings = AppStrings.counterWarningMessages;

    ref.listen<int>(withAutoDisposedModCounterProvider, (previous, next) {
      if (warnings.containsKey(next)) {
        DialogService.showAlertErrorDialog(context, warnings[next]!);
      }
    });
  }
}
