import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ! StateProvider with a family modifier, which allows passing an external parameter
final counterProviderWithFamilyMod = StateProvider.family<int, int>((
  ref,
  initialValue,
) {
  ref.onDispose(
    () => debugPrint(
      '🛑 [counterProviderWithFamilyMod $initialValue] was disposed',
    ),
  );
  // ? The initial state is set to the value passed into the provider
  return initialValue;
});
