import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../features/13_async_values/domain/provider_4_weather_app_with_first_state_shape.dart';
import '../../../../features/13_async_values/domain/provider_4_weather_app_with_second_state_shape.dart';
import '../../../../features/13_async_values/domain/selected_city_index_provider.dart';
import '../../../domain/models/enums.dart';
import '../text_widget.dart';

class GetAnotherCityWeatherButton extends ConsumerWidget {
  final bool isButtonForFirstStateShape;
  final NotifierProvider<BaseSelectedCityIndexNotifier, int> indexProvider;

  const GetAnotherCityWeatherButton({
    super.key,
    required this.isButtonForFirstStateShape,
    required this.indexProvider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCityIndex = ref.watch(indexProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          final cityIndex = selectedCityIndex % Cities.values.length;
          final city = Cities.values[cityIndex];

          /// Increment index
          ref.read(indexProvider.notifier).increment();

          /// Update weather
          if (isButtonForFirstStateShape) {
            ref
                .read(withFirstStateShapeWeatherProvider.notifier)
                .getTemperature(city);
          } else {
            ref.read(forSecondStateShapeCityProvider.notifier).changeCity(city);
          }
        },
        child: const TextWidget('Go to other city', TextType.titleMedium),
      ),
    );
  }
}
