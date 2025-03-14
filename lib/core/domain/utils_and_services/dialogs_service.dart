import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/helpers.dart';
import '../../ui/widgets/alert_dialog.dart';
import '../../ui/widgets/feature_selection_dialog.dart';
import '../app_constants/app_constants.dart';

/// 💬 **[DialogService] - A centralized service for managing app dialogs.**
/// - Provides reusable dialogs for **errors, selections, and loading states**.
/// - Ensures a **consistent UI/UX** across the application.
abstract class DialogService {
  /// 🛠 **Displays a feature selection dialog.**
  /// - Used to allow users to configure or choose a feature dynamically.
  static Future<void> showFeatureSelectionDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => const FeatureSelectionDialog(),
    );
  }

  /// ⏳ **Displays a loading dialog with a centered `CircularProgressIndicator`.**
  /// - Prevents unintended dismissals while loading.
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  /// 🛑 **Displays an error alert dialog with customizable height.**
  static void showAlertErrorDialog(
    BuildContext context,
    String errorText, {
    double? dialogHeightFactor,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false, // ❌ Prevents unintended dismissals
      builder: (context) {
        final deviceHeight = Helpers.getDeviceSize(context).height;
        final heightFactor =
            dialogHeightFactor ?? AppConstants.dialogHeightFactor;

        return ErrorAlertDialog(
          errorText: errorText,
          dialogHeight: deviceHeight * heightFactor,
        );
      },
    );
  }

  /// ❌ **Closes any currently open dialogs.**
  /// - Ensures that a dialog is closed only if there is an active one.
  static void closeDialog(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
