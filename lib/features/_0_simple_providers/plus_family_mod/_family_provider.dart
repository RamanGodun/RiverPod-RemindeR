/*
import 'package:riverpod/riverpod.dart';

final familyProvider = Provider.family<String, String>((ref, name) {
  ref.onDispose(() {
    print('[familyHelloProvider] was disposed');
  });

  return 'Hello family $name';
});
 */

/*
 This provider does not automatically dispose when no widget is using it.
 The `onDispose` callback will never be triggered unless you manually
 invalidate or refresh the provider.

 Use this provider when you want to retain the state throughout the entire
 lifecycle of the app or when the state should persist even after the widget
 that consumes it is no longer in use.

 However, if you need to refresh or manually dispose of this provider,
 you can call the `invalidate` or `refresh` methods on it through the `ref`.

 This is suitable when you need to store data or state that should be kept
 for the duration of the app's run, without being disposed automatically.
 */
