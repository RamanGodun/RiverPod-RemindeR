import 'package:flutter/material.dart';

/// 🌈 **[AppConstants]** - Centralized place for static UI-related constants.
abstract class AppConstants {
  // ────────────────────────────────────────────────────────────────────
  // 📏 Common UI Constants
  // ────────────────────────────────────────────────────────────────────
  static const double appBarElevation = 0.0;
  static const BorderRadius commonBorderRadius = BorderRadius.all(
    Radius.circular(12),
  );

  // ────────────────────────────────────────────────────────────────────
  // 🎨 Colors: macOS/iOS Inspired Palette
  // ────────────────────────────────────────────────────────────────────

  /// 🌙 **Dark Theme Colors**
  static const Color darkPrimaryColor = Color.fromARGB(255, 6, 148, 132);
  static const Color darkAccentColor = Color.fromARGB(255, 122, 143, 116);
  static const Color darkBackgroundColor = Color(0xFF1C1C1E);
  static const Color darkSurface = Color(0xFF2C2C2E);
  static const Color darkOverlay = Color(0xBF1C1C1E); // 75% opacity
  static const Color darkBorder = Color(0xFF3A3A3C);

  /// ☀️ **Light Theme Colors**
  static const Color lightPrimaryColor = Color.fromARGB(255, 1, 81, 75);
  static const Color lightAccentColor = Color.fromARGB(255, 162, 196, 171);
  static const Color lightBackgroundColor = Color(0xFFF2F2F7);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOverlay = Color(0xBFFFFFFF); // 75% opacity
  static const Color lightBorder = Color(0xFFD6D6D6);

  // ────────────────────────────────────────────────────────────────────
  // 🔥 Fatal Game Specific Colors
  // ────────────────────────────────────────────────────────────────────
  static const Color fatalGameRestartBorder = Colors.greenAccent;

  // ────────────────────────────────────────────────────────────────────
  // 🚨 Common Colors
  // ────────────────────────────────────────────────────────────────────
  static const Color errorColor = Colors.redAccent;
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color black = Colors.black;

  // ────────────────────────────────────────────────────────────────────
  // 🌈 Overlay & Transparency
  // ────────────────────────────────────────────────────────────────────
  static const Color overlayDarkBackground = darkOverlay;
  static const Color overlayLightBackground = lightOverlay;
  static const Color overlayDarkTextColor = Colors.white;
  static const Color overlayLightTextColor = Colors.black;
  static const Color overlayDarkBorder = Color(0xFF2C2C2E);
  static const Color overlayLightBorder = Color(0xFFD6D6D6);

  /// 🎯 Game-specific step values
  static const int incrementStep = 5;
  static const int decrementStep = -5;
  static const int disableButtonsThreshold = 105;

  // ────────────────────────────────────────────────────────────────────
  // 📐 Dialog Constants
  // ────────────────────────────────────────────────────────────────────
  static const double dialogHeightFactor = 0.1;
}
