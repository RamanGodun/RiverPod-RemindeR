import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../ui/_theming/theme_provider.dart';
import '../models/enums.dart';
import 'overlay/overlay_service.dart';

/// 🛠️ **[Helpers]** - Utility class for common navigation & theme operations.

/// Provides static methods to streamline navigation and access theme properties.
/// 📌 Допоміжний метод для навігації
class Helpers {
  static void goToFeature(BuildContext context, AppFeature feature) {
    switch (feature) {
      case AppFeature.simpleProvider:
        context.push('/simple-provider');
        break;
      case AppFeature.stateProvider:
        context.push('/state-provider');
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Feature not implemented")),
        );
    }
  }

  /// 📌 **Pushes a new route** with the provided [child] widget.
  static Future<void> pushTo(BuildContext context, Widget child) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => child),
    );
  }

  /// 🔄 **Navigates to a named route** specified by [routeName].
  static void pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static bool isDarkMode(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return isDarkMode;
  }

  /// 🎨 **Retrieves the current theme** from the [BuildContext].
  /// Useful when accessing theme-based properties like colors or typography.
  static ThemeData getTheme(BuildContext context) {
    return Theme.of(context);
  }

  /// 🔠 **Returns the current text theme** from the app's theme.
  /// Facilitates consistent text styling throughout the app.
  static TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  /// 🎨 **Fetches the color scheme** from the app's theme.
  /// Enables access to standardized color definitions such as primary, secondary, and error colors.
  static ColorScheme getColorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  //

/*
  static void goTo(
    BuildContext context,
    String routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    return context.goNamed(
      routeName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }
 */

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
      // Якщо маршрут не знайдено, перенаправляємо на сторінку помилки
      GoRouter.of(context).go('/unknown');
    }
  }

  /* For TIMER
   */
  static String zeroPaddedTwoDigits(double ticks) {
    return ticks.floor().toString().padLeft(2, '0');
  }

  static String formatTimer(int ticks) {
    final minutes = zeroPaddedTwoDigits((ticks / 60) % 60);
    final seconds = zeroPaddedTwoDigits(ticks % 60);
    return '$minutes:$seconds';
  }

  /// 🎨 **Перемикає тему та показує повідомлення**
  static void toggleTheme(BuildContext context, WidgetRef ref) {
    final isDark = isDarkMode(context);
    ref.read(themeProvider.notifier).toggleTheme();
    OverlayNotificationService.showOverlay(
      context,
      message: "Theme changed to ${isDark ? 'Light' : 'Dark'}",
      icon: isDark ? Icons.wb_sunny : Icons.nightlight_round,
    );
  }
}
