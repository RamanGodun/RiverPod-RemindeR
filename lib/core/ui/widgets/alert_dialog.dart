import 'package:flutter/material.dart';

import '../../domain/app_constants/app_constants.dart';
import '../../domain/utils_and_services/helpers.dart';
import 'mini_widgets.dart';
import 'text_widget.dart';

/// 📌 **Reusable AlertDialog for error messages**
class ErrorAlertDialog extends StatelessWidget {
  final String errorText;
  final double dialogHeight;

  const ErrorAlertDialog({
    super.key,
    required this.errorText,
    required this.dialogHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 58.0),
      child: AlertDialog(
        title: const TextWidget(
          '⚠ Warning',
          TextType.titleLarge,
          color: AppConstants.errorColor,
        ),
        content: SizedBox(
          height: dialogHeight,
          child: Center(child: AppMiniWidgets(MWType.error, error: errorText)),
        ),
        actions: [
          TextButton(
            onPressed: () => Helpers.pop(context),
            child: Center(
              child: TextWidget(
                'OK',
                TextType.button,
                color: Helpers.getColorScheme(context).primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
