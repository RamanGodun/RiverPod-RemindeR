import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/config/observer/async_value_logger.dart';
import '../../../core/domain/utils_and_services/dialogs_service.dart';
import '../../../core/ui/widgets/buttons/get_weather_button.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/provider_4_weather_app_with_second_state_shape.dart';
import '../domain/selected_city_index_provider.dart';

class PageWeatherAppWithSecondStateShape extends ConsumerWidget {
  const PageWeatherAppWithSecondStateShape({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listenWeatherErrors(ref, context);
    final weather = ref.watch(withSecondStateShapeWeatherProvider);
    AsyncValueLogger.log(weather);

    return Scaffold(
      appBar: CustomAppBar(
        isCenteredTitle: true,
        title: 'Second state shape',
        actionIcons: const [Icons.refresh],
        actionCallbacks: _buildActionCallbacks(ref),
      ),

      ///
      body: Center(
        child: weather.when(
          skipError: true,
          skipLoadingOnRefresh: false,
          // skipLoadingOnReload: true,

          ///
          data: (temp) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(temp, TextType.headlineSmall),
                const SizedBox(height: 20),
                GetAnotherCityWeatherButton(
                  isButtonForFirstStateShape: false,
                  indexProvider: selectedCityIndexProviderForSecondStateShape,
                ),
              ],
            );
          },

          ///
          error:
              (e, st) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppMiniWidgets(MWType.error, error: e.toString()),
                  const SizedBox(height: 20),
                  GetAnotherCityWeatherButton(
                    isButtonForFirstStateShape: false,
                    indexProvider: selectedCityIndexProviderForSecondStateShape,
                  ),
                ],
              ),

          ///
          loading: () => const AppMiniWidgets(MWType.loading),
        ),
      ),
    );
  }

  /// 🔔 Handles listening to provider errors and shows error dialog.
  void _listenWeatherErrors(WidgetRef ref, BuildContext context) {
    ref.listen<AsyncValue<String>>(withSecondStateShapeWeatherProvider, (
      previous,
      next,
    ) {
      if (next.hasError && !next.isLoading) {
        DialogService.showAlertErrorDialog(context, next.error.toString());
      }
    });
  }

  /// 🛠️ Builds action callbacks for AppBar
  List<VoidCallback> _buildActionCallbacks(WidgetRef ref) {
    return [
      () {
        ref.read(selectedCityIndexProviderForSecondStateShape.notifier).reset();
        ref.invalidate(forSecondStateShapeCityProvider);
        ref.invalidate(withSecondStateShapeWeatherProvider);
      },
    ];
  }

  ///
}
