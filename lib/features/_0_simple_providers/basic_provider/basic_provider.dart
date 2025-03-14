/*
import 'package:riverpod/riverpod.dart';

final helloProvider = Provider<String>((ref) {
  ref.onDispose(() {
    print('[helloProvider] was disposed');
  });

  return 'Hello providers';
});

final wordsProvider = Provider<String>((ref) {
  ref.onDispose(() {
    print('[wordsProvider] was disposed');
  });

  return 'Words provider';
});
 */

/*
 This provider  does not dispose automatically.
 The `onDispose` callback is never triggered because
 the provider stays in memory throughout the entire app run.

 Use this type of provider when you need to retain the state
 or data for the entire duration of the app lifecycle.

 This is suitable for global states or configurations that
 should persist as long as the app is running.

 If you want to manually dispose or refresh this provider,
 you can call `invalidate` or `refresh` through the `ref` object.
 */
