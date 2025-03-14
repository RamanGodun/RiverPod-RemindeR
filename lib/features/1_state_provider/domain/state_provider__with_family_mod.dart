import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider with a family modifier, which allows passing an external parameter
final familyCounterProvider = StateProvider.family<int, int>((
  ref,
  initialValue,
) {
  ref.onDispose(
    () => print('[familyCounterProvider $initialValue] was disposed'),
  );
  // The initial state is set to the value passed into the provider
  return initialValue;
});
