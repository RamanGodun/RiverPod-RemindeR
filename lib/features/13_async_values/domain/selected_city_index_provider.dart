import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseSelectedCityIndexNotifier extends Notifier<int> {
  @override
  int build() => 1;

  void increment() => state++;
  void reset() => state = 1;
}

/// 🌐 For First State Shape
final selectedCityIndexProviderForFirstStateShape =
    NotifierProvider<SelectedCityIndexNotifierForFirst, int>(
      () => SelectedCityIndexNotifierForFirst(),
    );

class SelectedCityIndexNotifierForFirst extends BaseSelectedCityIndexNotifier {}

/// 🌐 For Second State Shape
final selectedCityIndexProviderForSecondStateShape =
    NotifierProvider<SelectedCityIndexNotifierForSecond, int>(
      () => SelectedCityIndexNotifierForSecond(),
    );

class SelectedCityIndexNotifierForSecond
    extends BaseSelectedCityIndexNotifier {}
