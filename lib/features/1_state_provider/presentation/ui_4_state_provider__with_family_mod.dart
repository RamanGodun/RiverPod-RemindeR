import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/app_constants/app_constants.dart';
import '../../../core/domain/utils_and_services/dialogs_service.dart';
import '../../../core/ui/widgets/buttons/outlined.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/state_provider__with_family_mod.dart';

class Page4StateProviderWithFamilyMod extends ConsumerWidget {
  const Page4StateProviderWithFamilyMod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 🚀 **Initializing values for the dramatic conflict**
    const valueForIncrementing = 5;
    const valueForDecrementing = -5;

    /// 📊 **Tracking two independent states with Family Modifier**
    final valueIncrementation = ref.watch(
      counterProviderWithFamilyMod(valueForIncrementing),
    );
    final valueDecrementation = ref.watch(
      counterProviderWithFamilyMod(valueForDecrementing),
    );

    /// 🔥 **Calculating the difference - Humanity depends on it!**
    final valueDifference = valueIncrementation - valueDecrementation;

    /// 🚨 **Alert the world when the difference reaches catastrophic levels**
    _listenForDoomsday(ref, context, valueDifference);

    /// 🎨 **Dynamic background color based on the difference value**
    final Color backgroundColor =
        valueDifference >= 100
            ? Colors.black
            : valueDifference >= 70
            ? Colors.redAccent.shade700
            : valueDifference >= 50
            ? Colors.deepOrange
            : valueDifference >= 20
            ? Colors.yellow.shade700
            : Colors.blueGrey.shade900;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const TextWidget(
          '🌍 The World Depends on You!',
          TextType.titleMedium,
        ),
      ),
      body: Column(
        spacing: 30,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// ⚠ **The Difference - A Matter of Life and Death!**
          _buildDifferenceWidget(valueDifference),

          const SizedBox(height: 20),

          /// 🔴 **First Value - The Balance of the Universe**
          _buildValueRow('💥 First Core Value:', valueIncrementation),
          _buildButton('🔼 Increase Core Power (+5)', () {
            ref
                .read(
                  counterProviderWithFamilyMod(valueForIncrementing).notifier,
                )
                .update((state) => state + valueForIncrementing);
          }, disabled: valueDifference >= 105),

          const SizedBox(height: 80),

          /// 🔵 **Second Value - The Counterforce**
          _buildValueRow('🌀 Primary Core Value:', valueDecrementation),
          _buildButton('🔽 Decrease Counterforce (-5)', () {
            ref
                .read(
                  counterProviderWithFamilyMod(valueForDecrementing).notifier,
                )
                .update((state) => state + valueForDecrementing);
          }, disabled: valueDifference >= 105),
        ],
      ),
    );
  }

  /// 🛑 **DOOMSDAY ALERT: When the difference reaches a critical level!**
  void _listenForDoomsday(WidgetRef ref, BuildContext context, int difference) {
    const apocalypseWarnings = {
      20:
          "⚠ The balance is shifting! \nPlease, stay calm before it's too late! 🧘‍♂️😳⏳",
      35:
          "🛰️ Google Top Trends: \n‘How to stop global disaster’, \ncoincidence? 🤔📉🔥",
      50:
          "🚨 The Earth trembles! \nScientists say: ‘This shouldn’t be happening…’ 🌍🔬",
      70:
          "⚡ Government launches  'STOP CLICKING’ Project, \nBut will you listen?  🤨🤞",
      90:
          "Humanity's fate hangs by a thread! Not only 'black lives', but also \nEVERY click matters!🫷☠️🫸",
      95:
          "🔥 Cities report power outages, Trump becomes normal one, even your Wi-Fi signal is panicking 📶😱",
      100:
          "💥 GAME OVER! The timeline collapses into chaos! \nYour fault! \nNice job, genius. 🫵👀",
    };

    /// 🔥 **Listen to changes in both providers and track the difference**
    ref.listen<int>(
      counterProviderWithFamilyMod(5),
      (previous, next) =>
          _checkDifference(context, difference, apocalypseWarnings),
    );

    ref.listen<int>(
      counterProviderWithFamilyMod(-5),
      (previous, next) =>
          _checkDifference(context, difference, apocalypseWarnings),
    );
  }

  /// 📢 **Triggers the warning dialog when a catastrophic difference is reached!**
  void _checkDifference(
    BuildContext context,
    int difference,
    Map<int, String> warnings,
  ) {
    if (warnings.containsKey(difference)) {
      DialogService.showAlertErrorDialog(
        context,
        warnings[difference]!,
        dialogHeightFactor: 0.17,
      );
    }
  }

  /// 🎭 **Builds the UI for the difference display**
  Widget _buildDifferenceWidget(int valueDifference) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      decoration: BoxDecoration(
        color:
            valueDifference >= 50
                ? Colors.black.withOpacity(0.8)
                : Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:
                valueDifference >= 50
                    ? Colors.red.withOpacity(0.5)
                    : Colors.blueGrey.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          TextWidget(
            valueDifference < 105 ? '⚠ Critical Difference: ' : '',
            TextType.titleLarge,
            isTextOnFewStrings: true,
            color: Colors.white,
          ),
          TextWidget(
            valueDifference > 100
                ? "Now is no difference, what the difference..."
                : '$valueDifference',
            valueDifference < 105 ? TextType.headlineSmall : TextType.bodySmall,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  /// 🏆 **Builds a row displaying a value**
  Widget _buildValueRow(String label, int value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(label, TextType.titleLarge, color: Colors.white),
        TextWidget(
          '$value',
          TextType.headlineSmall,
          color: AppConstants.errorColor,
        ),
      ],
    );
  }

  /// 🖲️ **Creates a styled button with a disable option**
  Widget _buildButton(
    String label,
    VoidCallback onPressed, {
    bool disabled = false,
  }) {
    return CustomOutlinedButton(
      buttonText: label,
      onPressed:
          disabled
              ? null
              : () {
                onPressed();
              },
    );
  }
}
