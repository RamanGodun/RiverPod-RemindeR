import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProviderWithAutoDisposedFamilyMod = StateProvider.autoDispose
    .family<int, int>((ref, initialValue) {
      ref.onDispose(
        () => debugPrint(
          '[counterProviderWithAutoDisposedMod $initialValue] was disposed',
        ),
      );
      // The initial state is set to the value passed into the provider.
      return initialValue;
    });
