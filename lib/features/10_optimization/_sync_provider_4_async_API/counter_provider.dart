import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/domain/state/sh_prefs/shared_pref_provider.dart';

part 'counter_provider.g.dart';

// ignore: provider_dependencies
@Riverpod(dependencies: [sharedPreferences])
// use template with riverpodClass and then change it
class Counter extends _$Counter {
  @override
  int build() {
    final preferences = ref.watch(sharedPreferencesProvider);
    final currentValue = preferences.getInt('counter') ?? 0;

    listenSelf((previous, next) {
      print('previous: $previous, next: $next');
      preferences.setInt('counter', next);
    });

    return currentValue;
  }

  void increment() {
    state++;
  }
}
