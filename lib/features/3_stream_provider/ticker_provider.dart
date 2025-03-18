import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
In the case below, this provider is kept alive, so if the user leaves the page and returns,
the ticker will **continue ticking** without resetting. This is similar to using `@Riverpod(keepAlive: true)`
within code generation.
*/
final tickerProvider = StreamProvider<int>((ref) {
  // Registering a dispose callback to log when the provider is disposed
  ref.onDispose(() {
    print('[tickerProvider] disposed');
  });

  // Returning a Stream that emits a value every second, starting from 1, and takes 77 values.
  return Stream.periodic(const Duration(seconds: 1), (t) => t + 1).take(77);
});
