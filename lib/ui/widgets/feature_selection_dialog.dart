import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/enums.dart';
import '../../domain/state/features_provider.dart';
import '../widgets/text_widget.dart';

/// 📌 **[FeatureSelectionDialog] - UI для вибору фічі**
class FeatureSelectionDialog extends ConsumerWidget {
  const FeatureSelectionDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFeature = ref.watch(featureProvider);

    return AlertDialog(
      title: const TextWidget("Select feature", TextType.headlineSmall),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          const TextWidget(
            '   Please, select feature from next available in dropdown button',
            TextType.titleSmall,
            isTextOnFewStrings: true,
          ),
          DropdownButton<AppFeature>(
            value: currentFeature,
            isExpanded: true,
            items: AppFeature.values
                .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.label,
                      textAlign: TextAlign.center,
                    )))
                .toList(),
            onChanged: (newFeature) {
              if (newFeature != null) {
                ref.read(featureProvider.notifier).updateFeature(newFeature);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
