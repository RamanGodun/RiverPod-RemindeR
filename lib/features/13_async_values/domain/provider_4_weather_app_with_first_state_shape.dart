import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/domain/models/enums.dart';
part 'provider_4_weather_app_with_first_state_shape.g.dart';

@riverpod
class WithFirstStateShapeWeather extends _$WithFirstStateShapeWeather {
  @override
  FutureOr<String> build() {
    return _getTemp(Cities.kyiv);
  }

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

  Future<void> getTemperature(Cities city) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() => _getTemp(city));
  }
}
