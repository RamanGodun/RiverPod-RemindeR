
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticker_provider_gen.g.dart';

/*
! With @riverpod
The provider will be **autoDisposed** when there are no more widgets using it.
For example, if the ticker is started and the user navigates away from the page, the ticker will be automatically disposed of to free resources.
To keep the ticker alive even after the widget is disposed (caching the data), you need to set `keepAlive: true`.
This is useful when you want to retain the state across navigations or widget rebuilds.

In next case, we use `keepAlive: true` to ensure that the ticker stream remains active,
even if the widget using it is disposed, allowing the stream to continue emitting values.
 */
@Riverpod(keepAlive: true)
Stream<int> ticker(Ref ref) {
  ref.onDispose(() {
    print('[tickerProvider] disposed');
  });

  // Returning a Stream that emits a value every second, starting from 1.
  // The stream will emit values up to 77, and then complete.
  return Stream.periodic(const Duration(seconds: 1), (t) => t + 1).take(77);
}
