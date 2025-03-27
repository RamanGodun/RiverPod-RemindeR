import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/app_constants/app_constants.dart';
import 'package:riverpod_reminder/core/domain/app_constants/app_strings.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/dialogs_service.dart';
import 'package:riverpod_reminder/core/presentation/widgets/buttons/custom_floating_button.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';
import '../../../core/presentation/widgets/text_widget.dart';
import '../domain/basic_state_provider.dart';

class Page4BasicStateProvider extends ConsumerWidget {
  const Page4BasicStateProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _showDialogWhenCounterSpecific(ref, context);
    final value = ref.watch(clickedTimesProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Basic State provider'),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const TextWidget(
              AppStrings.basicStatePage,
              TextType.titleMedium,
              isTextOnFewStrings: true,
            ),

            const SizedBox(height: 15),
            const TextWidget(
              AppStrings.basicStateInstruction,
              TextType.titleLarge,
              isTextOnFewStrings: true,
            ),

            const SizedBox(height: 35),
            TextWidget(
              '$value ${value == 1 ? AppStrings.clickSingular : AppStrings.clickPlural}',
              TextType.headlineSmall,
              color: AppConstants.errorColor,
            ),
          ],
        ),
      ),

      ///
      floatingActionButton: CustomFloatingButton(
        onPressed: () => ref.read(counterProvider.notifier).increment(),
      ),
    );
  }

  /// 💬 Listen and show warning dialog at specific counter's values
  void _showDialogWhenCounterSpecific(WidgetRef ref, BuildContext context) {
    final warnings = AppStrings.counterWarningMessages;

    ref.listen<int>(counterProvider, (previous, next) {
      if (warnings.containsKey(next)) {
        DialogService.showAlertErrorDialog(context, warnings[next]!);
      }
    });
  }
}
