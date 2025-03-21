import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/app_constants/app_strings.dart';
import 'package:riverpod_reminder/core/domain/app_constants/app_constants.dart';
import '../../../core/domain/utils_and_services/dialogs_service.dart';
import '../../../core/ui/widgets/buttons/outlined.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/state_provider_with_auto_disposed_family_mod.dart';
import 'ui_elements_for_fatal_game.dart';

class Page4StateProviderWithAutoDisposedFamilyMod extends ConsumerWidget {
  const Page4StateProviderWithAutoDisposedFamilyMod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 🚀 Initializing values for the dramatic conflict
    const incrementValue = AppConstants.incrementStep;
    const decrementValue = AppConstants.decrementStep;

    /// 📊 Tracking two independent states with AutoDispose Modifier
    final valueIncrementation = ref.watch(
      counterProviderWithAutoDisposedFamilyMod(incrementValue),
    );
    final valueDecrementation = ref.watch(
      counterProviderWithAutoDisposedFamilyMod(decrementValue),
    );

    /// 🔥 Calculating the difference - Humanity depends on it!
    final valueDifference = valueIncrementation - valueDecrementation;

    /// 🚨 Alert the world when the difference reaches catastrophic levels
    _listenForDoomsday(ref, context, valueDifference);

    return Scaffold(
      backgroundColor: _calculateBackgroundColor(valueDifference),
      appBar: AppBar(
        title: const TextWidget(AppStrings.pageTitle, TextType.titleMedium),
      ),
      body: Column(
        spacing: 30,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// ⚠️ Displays the difference - The life & death margin
          DifferenceWidget(valueDifference),
          const SizedBox(height: 20),

          /// 🛑 Game Over? Allow restart
          if (valueDifference >= AppConstants.disableButtonsThreshold)
            RestartGameButton(onReset: () => _onReset(ref))
          else ...[
            /// 🔴 First Value - The Balance of the Universe
            ValueRow(
              label: AppStrings.firstCoreLabel,
              value: valueIncrementation,
              difference: valueDifference,
            ),
            CustomOutlinedButton(
              buttonText: AppStrings.incrementButtonText,
              onPressed: () => _onIncrement(ref),
              disabled: valueDifference >= AppConstants.disableButtonsThreshold,
            ),

            const SizedBox(height: 80),

            /// 🔵 Second Value - The Counterforce
            ValueRow(
              label: AppStrings.secondCoreLabel,
              value: valueDecrementation,
              difference: valueDifference,
            ),
            CustomOutlinedButton(
              buttonText: AppStrings.decrementButtonText,
              onPressed: () => _onDecrement(ref),
              disabled: valueDifference >= AppConstants.disableButtonsThreshold,
            ),
          ],
        ],
      ),
    );
  }

  /// 🛑 DOOMSDAY ALERT: Listening & triggering catastrophic warnings
  void _listenForDoomsday(WidgetRef ref, BuildContext context, int difference) {
    final warnings = AppStrings.apocalypseWarnings;

    /// 💥 Check & Show Dialog when difference hits critical
    void checkAndShowDialog(int diff) {
      if (warnings.containsKey(diff)) {
        DialogService.showAlertErrorDialog(
          context,
          warnings[diff]!,
          dialogHeightFactor: AppConstants.dialogHeightFactor,
        );
      }
    }

    /// 📡 Listening both providers
    ref.listen<int>(
      counterProviderWithAutoDisposedFamilyMod(AppConstants.incrementStep),
      (previous, next) => checkAndShowDialog(difference),
    );

    ref.listen<int>(
      counterProviderWithAutoDisposedFamilyMod(AppConstants.decrementStep),
      (previous, next) => checkAndShowDialog(difference),
    );
  }

  /// 🎨 Dynamic Background Color based on current danger level
  Color _calculateBackgroundColor(int valueDifference) {
    if (valueDifference >= 100) return Colors.black;
    if (valueDifference >= 70) return Colors.redAccent.shade700;
    if (valueDifference >= 50) return Colors.deepOrange;
    if (valueDifference >= 20) return Colors.yellow.shade700;
    return Colors.blueGrey.shade900;
  }

  /// 🔄 Handles Reset Logic
  void _onReset(WidgetRef ref) {
    ref.invalidate(
      counterProviderWithAutoDisposedFamilyMod(AppConstants.incrementStep),
    );
    ref.invalidate(
      counterProviderWithAutoDisposedFamilyMod(AppConstants.decrementStep),
    );
  }

  /// 🔼 Handles Increment Logic
  void _onIncrement(WidgetRef ref) {
    ref
        .read(
          counterProviderWithAutoDisposedFamilyMod(
            AppConstants.incrementStep,
          ).notifier,
        )
        .update((state) => state + AppConstants.incrementStep);
  }

  /// 🔽 Handles Decrement Logic
  void _onDecrement(WidgetRef ref) {
    ref
        .read(
          counterProviderWithAutoDisposedFamilyMod(
            AppConstants.decrementStep,
          ).notifier,
        )
        .update((state) => state + AppConstants.decrementStep);
  }
}
