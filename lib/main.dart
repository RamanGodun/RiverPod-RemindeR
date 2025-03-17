import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

import 'core/domain/app_constants/app_strings.dart';
import 'core/domain/config/observer/observer_logger.dart';
import 'core/ui/_theming/app_theme.dart';
import 'core/ui/_theming/theme_provider.dart';
import 'core/ui/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(ProviderScope(observers: [Logger()], child: const MainApp()));
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

/* 
!   dart run build_runner build watch 
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch --delete-conflicting-outputs

flutter pub run build_runner clean
*/


/*

 */