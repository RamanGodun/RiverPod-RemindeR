import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../ui/_theming/theme_provider.dart';
import 'overlay/overlay_service.dart';

/// Global singleton instance of `Uuid` used across the app to generate unique IDs.
final Uuid uuid = const Uuid();

/// 🛠️ **[Helpers]** - Utility class for common navigation & theme operations.
/// Provides static methods to streamline navigation and access theme properties.
class Helpers {
  // ================================
  // 📌 NAVIGATION
  // ================================

  /// Pops the current route.
  static void pop(BuildContext context) {
    Navigator.of(context).pop(context);
  }

  /// 📌 **Pushes a new route** with the provided [child] widget.
  static Future<void> pushTo(BuildContext context, Widget child) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (_) => child));
  }

  /// 🔄 **Navigates to a named route** specified by [routeName].
  static void pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  /// 🗺️ **Navigates using GoRouter with optional parameters**
  static void goTo(
    BuildContext context,
    String routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    try {
      GoRouter.of(context).goNamed(
        routeName,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      );
    } catch (e) {
      // If route wasn't found - redirect to "Error page"
      GoRouter.of(context).go('/unknown');
    }
  }

  // ================================
  // 🎨 THEME
  // ================================

  /// Checks if current theme is dark mode.
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// 🎨 **Retrieves the current theme** from the [BuildContext].
  static ThemeData getTheme(BuildContext context) {
    return Theme.of(context);
  }

  /// 🔠 **Returns the current text theme** from the app's theme.
  static TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  /// 🎨 **Fetches the color scheme** from the app's theme.
  static ColorScheme getColorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  /// 🌗 Toggles between dark & light themes and shows overlay message.
  static void toggleTheme(BuildContext context, WidgetRef ref) {
    final isDark = isDarkMode(context);
    ref.read(themeProvider.notifier).toggleTheme();
    OverlayNotificationService.showOverlay(
      context,
      message: "Theme changed to ${isDark ? 'Light' : 'Dark'}",
      icon: isDark ? Icons.wb_sunny : Icons.nightlight_round,
    );
  }

  // ================================
  // 📅 DATE & TIME
  // ================================

  /// 📅 **Formats [DateTime] object into a readable string for displaying item creation dates.**
  static String formatCreationDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0 && now.day == date.day) {
      return 'Today, ${DateFormat('HH:mm').format(date)}';
    } else if (difference <= 1 && now.day - date.day == 1) {
      return 'Yesterday, ${DateFormat('HH:mm').format(date)}';
    } else {
      return DateFormat('dd MMM yyyy, HH:mm').format(date);
    }
  }

  /// For TIMER: adds leading zeros
  static String zeroPaddedTwoDigits(double ticks) {
    return ticks.floor().toString().padLeft(2, '0');
  }

  /// ⏱️ Formats seconds into mm:ss
  static String formatTimer(int ticks) {
    final minutes = zeroPaddedTwoDigits((ticks / 60) % 60);
    final seconds = zeroPaddedTwoDigits(ticks % 60);
    return '$minutes:$seconds';
  }

  // ================================
  // 📱 DEVICE DATA
  // ================================

  /// Returns the current device screen size.
  static Size getDeviceSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
