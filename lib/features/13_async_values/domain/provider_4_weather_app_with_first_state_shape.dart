import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/domain/models/enums.dart';
part 'provider_4_weather_app_with_first_state_shape.g.dart';

/// A simple [AsyncNotifier] that fetches weather temperature based on a selected [Cities] enum.
@riverpod
class WithFirstStateShapeWeather extends _$WithFirstStateShapeWeather {
  @override
  FutureOr<String> build() {
    return _getTemp(Cities.kyiv); //Loads initial temperature for Kyiv.
  }

  /// Simulates fetching temperature for a given [city].
  /// Some cities throw errors to simulate failure scenarios.
  Future<String> _getTemp(Cities city) async {
    await Future.delayed(const Duration(seconds: 1));

    switch (city) {
      case Cities.kyiv:
        return 'Today in ${city.name} -23';
      case Cities.ternopil:
        throw 'Fail to fetch the temperature of ${city.name}';
      case Cities.rivne:
        throw 'Fail to fetch the temperature of ${city.name}';
      case Cities.lviv:
        return 'Today in ${city.name} +28';
    }
  }

  /// Public method to fetch temperature based on selected [city].
  /// Updates the state to loading first, then sets data or error via [AsyncValue.guard].
  Future<void> getTemperature(Cities city) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getTemp(city));
  }
}
