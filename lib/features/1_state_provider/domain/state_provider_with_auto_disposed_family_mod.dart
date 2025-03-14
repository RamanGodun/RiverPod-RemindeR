import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProviderWithAutoDisposedFamilyMod = StateProvider.autoDispose
    .family<int, int>((ref, initialValue) {
      ref.onDispose(
        () => print(
          '[counterProviderWithAutoDisposedMod $initialValue] was disposed',
        ),
      );
      // The initial state is set to the value passed into the provider.
      return initialValue;
    });
