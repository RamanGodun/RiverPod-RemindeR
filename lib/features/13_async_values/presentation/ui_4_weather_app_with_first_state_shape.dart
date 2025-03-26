import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/dialogs_service.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/config/observer/async_value_logger.dart';
import '../../../core/ui/widgets/buttons/get_weather_button.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/provider_4_weather_app_with_first_state_shape.dart';
import '../domain/selected_city_index_provider.dart';

class PageForWeatherAppWithFirstStateShape extends ConsumerWidget {
  const PageForWeatherAppWithFirstStateShape({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listenWeatherErrors(ref, context);
    final weather = ref.watch(withFirstStateShapeWeatherProvider);
    AsyncValueLogger.log(weather);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'First state shape',
        actionIcons: const [Icons.refresh],
        actionCallbacks: _buildActionCallbacks(ref),
        isCenteredTitle: true,
      ),

      ///
      body: Center(
        child: weather.when(
          // ! this allows to show on device previously got data, when we have 2 or more errors,
          // ! in another case during second error we have previous error
          skipError: true,
          skipLoadingOnRefresh: false,

          ///
          data: (temperature) {
            return Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(temperature, TextType.headlineSmall),

                GetAnotherCityWeatherButton(
                  isButtonForFirstStateShape: true,
                  indexProvider: selectedCityIndexProviderForFirstStateShape,
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
                    isButtonForFirstStateShape: true,
                    indexProvider: selectedCityIndexProviderForFirstStateShape,
                  ),
                ],
              ),

          ///
          loading: () => const AppMiniWidgets(MWType.loading),
        ),
      ),
    );
  }

  /// 🔔 Handles listening to provider errors and showing error dialog.
  void _listenWeatherErrors(WidgetRef ref, BuildContext context) {
    ref.listen<AsyncValue<String>>(withFirstStateShapeWeatherProvider, (
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
        ref.read(selectedCityIndexProviderForFirstStateShape.notifier).reset();
        ref.invalidate(withFirstStateShapeWeatherProvider);
      },
    ];
  }

  ///
}
