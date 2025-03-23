import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/enums.dart';
import '../../domain/providers/features_provider.dart';
import '../../domain/utils_and_services/helpers.dart';
import 'text_widget.dart';

/// 📌 [FeatureSelectionDialog]
class FeatureSelectionDialog extends ConsumerWidget {
  const FeatureSelectionDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFeature = ref.watch(featureProvider);
    final colorScheme = Helpers.getColorScheme(context);

    return AlertDialog(
      title: const TextWidget("Select feature", TextType.headlineSmall),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          const SizedBox(
            height: 80,
            child: TextWidget(
              'Please select a feature from the dropdown menu below. And don\'t be shy to explore it 😉',
              TextType.bodyLarge,
              isTextOnFewStrings: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
            ///
            DropdownButton<AppFeature>(
              value: currentFeature,
              isExpanded: true,
              items:
                  AppFeature.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: TextWidget(
                            e.label,
                            TextType.titleMedium,
                            color: colorScheme.primary,
                          ),
                        ),
                      )
                      .toList(),
              onChanged: (newFeature) {
                if (newFeature != null) {
                  ref.read(featureProvider.notifier).updateFeature(newFeature);
                  Helpers.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
