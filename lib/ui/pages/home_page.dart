import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/ui/widgets/custom_button.dart';
import 'package:riverpod_reminder/ui/widgets/text_widget.dart';
import '../../domain/app_constants/app_strings.dart';
import '../_theming/theme_provider.dart';
import 'other_page.dart';

/// 🏠 **[MyHomePage] - Home screen with theme toggle button.**
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(AppStrings.appTitle, TextType.titleMedium),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            TextWidget('Welcome to Riverpod Reminder!', TextType.bodyLarge),
            CustomButton(title: 'Button', child: OtherPage()),
          ],
        ),
      ),
    );
  }
}
