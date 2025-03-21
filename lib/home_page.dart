import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/buttons/custom_button.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';
import 'features/13_async_values/presentation/_async_values_page.dart';
import 'features/1_simple_providers/presentation/_simple_providers_page.dart';
import 'features/11_optimization/_presentation/_providers_optimization_page.dart';
import 'features/12_pagination/_presentation/_pagination_page.dart';
import 'features/2_state_provider/presentation/_state_providers_page.dart';
import 'features/3_future_provider/presentation/_future_providers_page.dart';
import 'features/4_stream_provider/ticker_presentation.dart';
import 'core/domain/app_constants/app_strings.dart';
import 'core/domain/models/enums.dart';
import 'core/domain/state/_features_provider.dart';
import 'core/domain/utils_and_services/dialogs_service.dart';
import 'core/domain/utils_and_services/helpers.dart';
import 'core/ui/_theming/theme_provider.dart';
import 'features/5_state_or_change_notifier_provider/presentation/_todos_ui.dart';
import 'features/6_notifier_provider_bp/presentation/_notifier_providers_page.dart';
import 'features/7_async_provider/presentation/_async_providers_page.dart';
import 'features/8_async_notifier_provider_bp/presentation/_async_notifier_providers_page.dart';
import 'features/9_stream_provider/presentation/_stream_providers_page.dart';
import 'features/10_providers_lifecycle/_presentation/_providers_lifecycle_page.dart';

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
      return const StateProvidersPage();
    case AppFeature.futureProvider:
      return const FutureProvidersPage();
    case AppFeature.streamProvider:
      return const Page4TickerOnStreamProvider();
    case AppFeature.stateOrChangeNotifier:
      return const TodosPageOnStateOrChangeNotifierProvider();
    case AppFeature.notifierProvider:
      return const NotifierProvidersPage();
    case AppFeature.asyncProvider:
      return const AsyncProvidersPage();
    case AppFeature.asyncNotifierProvider:
      return const Page4AsyncNotifierProviders();
    case AppFeature.asyncStreamProvider:
      return const Page4AsyncStreamProviders();
    case AppFeature.providersLifecycle:
      return const Page4ProvidersLifecycle();
    case AppFeature.optimization:
      return const ProvidersOptimizationPage();
    case AppFeature.pagination:
      return const PaginationPage();
    case AppFeature.asyncValues:
      return const AsyncValuesPage();
    /*

    */
    // default:
    //   return const SimpleProvidersPage();
  }
}
