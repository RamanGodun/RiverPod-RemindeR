import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 🔁 Base Notifier for managing a selected city index.
/// Used to switch between cities in different state shape implementations.
abstract class BaseSelectedCityIndexNotifier extends Notifier<int> {
  @override
  int build() => 1;

  /// Increments the selected city index.
  void increment() => state++;

  /// Resets the selected city index to default (1).
  void reset() => state = 1;
}

/// 🌐 Notifier used in the first state shape implementation.
final selectedCityIndexProviderForFirstStateShape =
    NotifierProvider<SelectedCityIndexNotifierForFirst, int>(
      () => SelectedCityIndexNotifierForFirst(),
    );

class SelectedCityIndexNotifierForFirst extends BaseSelectedCityIndexNotifier {}

/// 🌐 Notifier used in the second state shape implementation.
final selectedCityIndexProviderForSecondStateShape =
    NotifierProvider<SelectedCityIndexNotifierForSecond, int>(
      () => SelectedCityIndexNotifierForSecond(),
    );

class SelectedCityIndexNotifierForSecond
    extends BaseSelectedCityIndexNotifier {}
