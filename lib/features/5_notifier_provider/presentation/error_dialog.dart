import 'package:flutter/material.dart';
import '../../../core/ui/widgets/mini_widgets.dart';

class ErrorDialog extends StatelessWidget {
  final String errorMessage;

  const ErrorDialog({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: AppMiniWidgets(MWType.error, error: errorMessage),
    );
  }

  // Method to show the dialog.
  static void show(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return ErrorDialog(errorMessage: errorMessage);
      },
    );
  }
}
