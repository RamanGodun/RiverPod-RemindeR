import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/domain/models/enums.dart';

part 'provider_4_weather_app_with_second_state_shape.g.dart';

@riverpod
class ForSecondStateShapeCity extends _$ForSecondStateShapeCity {
  @override
  Cities build() {
    debugPrint('[cityProvider] initialized');
    ref.onDispose(() {
      debugPrint('[cityProvider] disposed');
    });
    return Cities.kyiv;
  }

  void changeCity(Cities city) {
    state = city;
  }
}

@riverpod
FutureOr<String> withSecondStateShapeWeather(Ref ref) async {
  debugPrint('[weatherSecondProvider] initialized');
  ref.onDispose(() {
    debugPrint('[weatherSecondProvider] disposed');
  });

  final city = ref.watch(forSecondStateShapeCityProvider);

  await Future.delayed(const Duration(seconds: 1));

  switch (city) {
    case Cities.kyiv:
      // throw 'Fail to fetch the temperature of ${city.name}';
      return '${city.name} - 23';
    case Cities.ternopil:
      throw 'Fail to fetch the temperature of ${city.name}';
    case Cities.rivne:
      throw 'Fail to fetch the temperature of ${city.name}';
    case Cities.lviv:
      return '${city.name} - 28';
  }
}
