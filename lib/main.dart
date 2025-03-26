import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:riverpod_reminder/core/domain/config/app_config.dart';

import 'core/domain/app_constants/app_strings.dart';
import 'core/domain/config/observer/observer_logger.dart';
import 'core/domain/config/router/router_provider.dart';
import 'core/domain/providers/sh_prefs/shared_pref_provider.dart';
import 'core/ui/_theming/app_theme.dart';
import 'core/ui/_theming/theme_provider.dart';
import 'core/ui/pages/home_page.dart';

Future<void> main() async {
  ///
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  await GetStorage.init();
  final sharedPrefs = await SharedPreferences.getInstance();

  ///
  runApp(
    ProviderScope(
      observers: [Logger()],
      overrides: [sharedPreferencesProvider.overrideWithValue(sharedPrefs)],
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final router = ref.watch(routerProvider);

    return AppConfig.isUsingGoRouter
        ? MaterialApp.router(
          title: 'GoRouter with Riverpod',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.getLightTheme(),
          darkTheme: AppThemes.getDarkTheme(),
          themeMode: themeMode,
          routerConfig: router,
        )
        : MaterialApp(
          title: AppStrings.appTitle,
          debugShowCheckedModeBanner: false,
          theme: AppThemes.getLightTheme(),
          darkTheme: AppThemes.getDarkTheme(),
          themeMode: themeMode,
          home: const MyHomePage(),
        );
  }
}
