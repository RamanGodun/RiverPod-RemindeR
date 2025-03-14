import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

/// 📦 Локальне сховище для збереження стану
final _storage = GetStorage();

/// 🎨 **[ThemeNotifier]** - Manages theme state using Riverpod.
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(_loadThemeFromStorage());

  /// 🚀 **Завантаження вибраної теми при старті**
  static ThemeMode _loadThemeFromStorage() {
    final savedTheme = _storage.read<String>('selectedTheme');
    return savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  /// 🔄 **Перемикання теми та збереження у GetStorage**
  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _storage.write('selectedTheme', state == ThemeMode.dark ? 'dark' : 'light');
  }
}
