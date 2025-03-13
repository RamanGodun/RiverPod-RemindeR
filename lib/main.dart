import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

import 'domain/app_constants/app_strings.dart';
import 'domain/config/observer/observer_logger.dart';
import 'ui/_theming/app_theme.dart';
import 'ui/_theming/theme_provider.dart';
import 'ui/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.getLightTheme(),
      darkTheme: AppThemes.getDarkTheme(),
      themeMode: themeMode,
      home: const MyHomePage(),
    );
  }
}
