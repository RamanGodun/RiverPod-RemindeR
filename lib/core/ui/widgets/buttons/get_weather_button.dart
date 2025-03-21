import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/enums.dart';
import '../text_widget.dart';

/// 📄 Reusable button to change city and trigger weather update.
/// - [selectedCityIndexProvider] - provider holding current index.
/// - [onCityChanged] - callback to change city (for second state shape: change provider's city).
/// - [updateWeather] - optional callback to manually update weather (for first state shape only).
class GetAnotherCityWeatherButton extends ConsumerWidget {
  final StateProvider<int> selectedCityIndexProvider;
  final void Function(Cities city, WidgetRef ref) onCityChanged;
  final void Function(Cities city, WidgetRef ref)? updateWeather;

  const GetAnotherCityWeatherButton({
    super.key,
    required this.selectedCityIndexProvider,
    required this.onCityChanged,
    this.updateWeather,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCityIndex = ref.watch(selectedCityIndexProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          final cityIndex = selectedCityIndex % Cities.values.length;
          final city = Cities.values[cityIndex];

          /// Trigger city change (works differently for each state shape)
          onCityChanged(city, ref);

          /// Optionally update weather if provided
          if (updateWeather != null) {
            updateWeather!(city, ref);
          }

          /// Increment index
          ref.read(selectedCityIndexProvider.notifier).state++;
        },
        child: const TextWidget('Go to other city', TextType.titleMedium),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../../features/13_async_values/first_state_shape/provider_4_weather_app_with_first_state_shape.dart';
// import '../../../../features/13_async_values/first_state_shape/selected_city_index_provider.dart';
// import '../../../domain/models/enums.dart';
// import '../text_widget.dart';

// class GetAnotherCityWeatherButton extends ConsumerWidget {
//   const GetAnotherCityWeatherButton({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedCityIndex = ref.watch(selectedCityIndexProvider);

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       width: double.infinity,
//       child: OutlinedButton(
//         onPressed: () {
//           final cityIndex = selectedCityIndex % 4;
//           final city = Cities.values[cityIndex];

//           ref
//               .read(withFirstStateShapeWeatherProvider.notifier)
//               .getTemperature(city);

//           /// Increment index
//           ref.read(selectedCityIndexProvider.notifier).state++;
//         },
//         child: const TextWidget('Go to other city', TextType.titleMedium),
//       ),
//     );
//   }
// }
