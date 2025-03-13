import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/ui/widgets/custom_button.dart';
import 'package:riverpod_reminder/ui/widgets/text_widget.dart';
import '../../domain/app_constants/app_strings.dart';
import '../../domain/utils_and_services/overlay_service.dart';
import '../_theming/theme_provider.dart';
import 'other_page.dart';

/// 🏠 **[MyHomePage] - Home screen with theme toggle button.**
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(AppStrings.appTitle, TextType.titleMedium),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
              OverlayNotificationService.showOverlay(
                context,
                message: "Theme changed to ${isDarkMode ? 'Light' : 'Dark'}",
                icon: isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            TextWidget('Welcome to Riverpod Reminder!', TextType.bodyLarge),
            CustomButton(title: 'Press Button', child: OtherPage()),
          ],
        ),
      ),
    );
  }
}
