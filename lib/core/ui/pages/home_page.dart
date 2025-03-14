import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_button.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';
import '../../../features/_0_simple_providers/_presentation/_simple_providers_page.dart';
import '../../domain/app_constants/app_strings.dart';
import '../../domain/models/enums.dart';
import '../../domain/state/features_provider.dart';
import '../../domain/utils_and_services/dialogs_service.dart';
import '../../domain/utils_and_services/helpers.dart';
import '../_theming/theme_provider.dart';

/// 🏠 **[MyHomePage] - Головна сторінка з кастомним AppBar**
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    final selectedFeature = ref.watch(featureProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.appTitle,
        actionIcons: [
          isDarkMode ? Icons.dark_mode : Icons.light_mode,
          Icons.settings,
        ],
        actionCallbacks: [
          () => Helpers.toggleTheme(context, ref),
          () => DialogService.showFeatureSelectionDialog(context),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            const TextWidget(
              'Welcome to Riverpod Reminder!',
              TextType.bodyLarge,
            ),

            /// 🚀 **Динамічна кнопка переходу до фічі**
            CustomButton(
              title: 'Go to ${selectedFeature.label}',
              child: getFeatureWidget(selectedFeature),
            ),
          ],
        ),
      ),
    );
  }
}

/// 📌 **Отримання віджета для обраної фічі**
Widget getFeatureWidget(AppFeature feature) {
  switch (feature) {
    case AppFeature.simpleProvider:
      return const SimpleProvidersPage();
    case AppFeature.stateProvider:
      return const Placeholder(); // Тут буде сторінка іншої фічі
    default:
      return const Placeholder(); // Тут будуть ще іншої фічі
  }
}
