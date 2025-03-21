import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
In the case below, this provider is kept alive, so if the user leaves the page and returns,
the ticker will **continue ticking** without resetting. This is similar to using `@Riverpod(keepAlive: true)`
within code generation.
*/
final tickerProviderWithoutCodeGen = StreamProvider<int>((ref) {
  ref.onDispose(() {
    debugPrint('[tickerProviderWithoutCodeGen] disposed');
  });
  // Returning a Stream that emits a value every second, starting from 1, and takes 77 values.
  return Stream.periodic(const Duration(seconds: 1), (t) => t + 1).take(77);
});
