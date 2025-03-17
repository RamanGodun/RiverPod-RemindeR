import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/domain/app_constants/app_constants.dart';
import 'package:riverpod_reminder/core/domain/app_constants/app_strings.dart';
import '../../../core/ui/widgets/buttons/outlined.dart';
import '../../../core/ui/widgets/text_widget.dart';

/// 🎭 **Displays the difference value with a dramatic effect**
class DifferenceWidget extends StatelessWidget {
  final int valueDifference;

  const DifferenceWidget(this.valueDifference, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      decoration: BoxDecoration(
        color:
            valueDifference >= 50
                ? AppConstants.black.withOpacity(0.8)
                : AppConstants.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:
                valueDifference >= 50
                    ? AppConstants.errorColor.withOpacity(0.5)
                    : AppConstants.errorColor.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          TextWidget(
            valueDifference < 105 ? AppStrings.criticalDifference : '',
            TextType.titleLarge,
            isTextOnFewStrings: true,
            color: AppConstants.white,
          ),
          TextWidget(
            valueDifference > 100
                ? AppStrings.noDifference
                : '$valueDifference',
            valueDifference < 105 ? TextType.headlineSmall : TextType.bodySmall,
            color: AppConstants.white,
          ),
        ],
      ),
    );
  }
}

/// 🏆 **Displays a labeled value with styling**
class ValueRow extends StatelessWidget {
  final String label;
  final int value;
  final int difference;

  const ValueRow({
    super.key,
    required this.label,
    required this.value,
    required this.difference,
  });

  @override
  Widget build(BuildContext context) {
    final useOtherColorOnThisDifferences = [
      ...List.generate(8, (index) => 50 + index * 5),
      90,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(label, TextType.titleLarge, color: AppConstants.white),
        TextWidget(
          '$value',
          TextType.headlineSmall,
          color:
              useOtherColorOnThisDifferences.contains(difference)
                  ? AppConstants.white
                  : AppConstants.errorColor,
        ),
      ],
    );
  }
}

/// 🔄 **Restart Game Button**
class RestartGameButton extends StatelessWidget {
  final VoidCallback onReset;

  const RestartGameButton({super.key, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      buttonText: AppStrings.restartButtonText,
      onPressed: onReset,
      borderColor: AppConstants.fatalGameRestartBorder,
      textColor: AppConstants.fatalGameRestartBorder,
    );
  }
}
