import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyAutoDisposedCounterProvider = StateProvider.autoDispose
    .family<int, int>((ref, initialValue) {
      ref.onDispose(
        () => print(
          '[familyAutoDisposedCounterProvider $initialValue] was disposed',
        ),
      );
      // The initial state is set to the value passed into the provider.
      return initialValue;
    });
