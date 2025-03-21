import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/dialogs_service.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/config/observer/async_value_logger.dart';
import '../../../core/ui/widgets/buttons/get_weather_button.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import 'provider_4_weather_app_with_first_state_shape.dart';
import 'selected_city_index_provider.dart';

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
        actionCallbacks: [
          () {
            ref.read(selectedCityIndexProvider.notifier).state = 1;
            ref.invalidate(withFirstStateShapeWeatherProvider);
          },
        ],
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
          data: (temp) {
            return Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(temp, TextType.headlineSmall),

                GetAnotherCityWeatherButton(
                  selectedCityIndexProvider: selectedCityIndexProvider,
                  onCityChanged: (city, ref) {},
                  updateWeather: (city, ref) {
                    ref
                        .read(withFirstStateShapeWeatherProvider.notifier)
                        .getTemperature(city);
                  },
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
                    selectedCityIndexProvider: selectedCityIndexProvider,
                    onCityChanged: (city, ref) {},
                    updateWeather: (city, ref) {
                      ref
                          .read(withFirstStateShapeWeatherProvider.notifier)
                          .getTemperature(city);
                    },
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

  // /// 🐞 Logs debug information about weather state.
  // void _logWeatherDebugInfo(AsyncValue<String> weather) {
  //   print(weather.toString());
  //   print(weather.props);

  //   try {
  //     print('value: ${weather.value}');
  //   } catch (e) {
  //     print(e.toString());
  //   }

  //   print('valueOrNull: ${weather.valueOrNull}');

  //   try {
  //     print('requireValue: ${weather.requireValue}');
  //   } on StateError {
  //     print('StateError');
  //   } catch (e) {
  //     print(e.toString());
  //   }

  //   print('===========');
  // }

  ///
}
