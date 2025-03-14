import 'package:flutter/material.dart';

/// 🌈 **[AppConstants]** - Holds static UI-related constants with modern macOS/iOS aesthetics.
abstract class AppConstants {
  static const double appBarElevation = 0.0;
  static const BorderRadius commonBorderRadius =
      BorderRadius.all(Radius.circular(12));

  // ────────────────────────────────────────────────────────────────────
  // 🎨 **Colors** (Based on macOS/iOS system)
  // ────────────────────────────────────────────────────────────────────

  /// 🌙 **Dark Theme Colors**
  static const Color darkPrimaryColor = Color(0xFF0A84FF); // macOS system blue
  static const Color darkAccentColor = Color(0xFF5E5CE6); // Secondary accent
  static const Color darkBackgroundColor = Color(0xFF1C1C1E);
  static const Color darkSurface = Color(0xFF2C2C2E);
  static const Color darkOverlay = Color(0xBF1C1C1E); // 75% opacity
  static const Color darkBorder = Color(0xFF3A3A3C);

  /// ☀️ **Light Theme Colors**
  static const Color lightPrimaryColor = Color(0xFF007AFF);
  static const Color lightAccentColor = Color(0xFF34C759);
  static const Color lightBackgroundColor = Color(0xFFF2F2F7);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOverlay = Color(0xBFFFFFFF); // 75% opacity
  static const Color lightBorder = Color(0xFFD6D6D6);

  /// 🚨 **Common Colors**
  static const Color errorColor = Colors.redAccent;
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color black = Colors.black;

  /// 🌈 **Overlay & Transparency**
  static const Color overlayDarkBackground = darkOverlay;
  static const Color overlayLightBackground = lightOverlay;
  static const Color overlayDarkTextColor = Colors.white;
  static const Color overlayLightTextColor = Colors.black;
  static const Color overlayDarkBorder = Color(0xFF2C2C2E);
  static const Color overlayLightBorder = Color(0xFFD6D6D6);
}
