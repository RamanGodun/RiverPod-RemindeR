// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_4_weather_app_with_second_state_shape.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$withSecondStateShapeWeatherHash() =>
    r'd4e4d612064a574847d3bd3e78287931f70ce6b9';

/// ☁️ Fetches the weather data for the selected city with 1-second delay.
/// Automatically rebuilds when the city changes.
///
/// Copied from [withSecondStateShapeWeather].
@ProviderFor(withSecondStateShapeWeather)
final withSecondStateShapeWeatherProvider =
    AutoDisposeFutureProvider<String>.internal(
  withSecondStateShapeWeather,
  name: r'withSecondStateShapeWeatherProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$withSecondStateShapeWeatherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WithSecondStateShapeWeatherRef = AutoDisposeFutureProviderRef<String>;
String _$forSecondStateShapeCityHash() =>
    r'2f47f4f99fc367f4cba8716007e5e7e3fac9ba6e';

/// 🌤️ Holds the currently selected city.
/// State is managed synchronously and updated manually.
///
/// Copied from [ForSecondStateShapeCity].
@ProviderFor(ForSecondStateShapeCity)
final forSecondStateShapeCityProvider =
    AutoDisposeNotifierProvider<ForSecondStateShapeCity, Cities>.internal(
  ForSecondStateShapeCity.new,
  name: r'forSecondStateShapeCityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$forSecondStateShapeCityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ForSecondStateShapeCity = AutoDisposeNotifier<Cities>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
