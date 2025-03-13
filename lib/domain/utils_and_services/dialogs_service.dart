import 'package:flutter/material.dart';

import '../../ui/widgets/feature_selection_dialog.dart';

/// 💬 **[DialogService] - A centralized service for managing app dialogs.**
/// - Provides reusable dialogs for **creating, editing, and loading states**.
/// - Ensures a **consistent UI/UX** across the application.
abstract class DialogService {
  /// 🔄 **Показати діалогове вікно вибору фічі**
  static Future<void> showFeatureSelectionDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => const FeatureSelectionDialog(),
    );
  }

  /// 🔄 **Displays a loading dialog with a centered `CircularProgressIndicator`.**
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // ❌ Prevents unintended dismissals
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  /// ❌ **Closes any currently open dialogs.**
  static void closeDialog(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
