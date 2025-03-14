import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_2_plus_family_mod_gen.g.dart';

@Riverpod(keepAlive: true)
String family(Ref ref, {required String customName}) {
  ref.onDispose(() {
    print('[familyProvider($customName)] was disposed');
  });

  return 'Hello family $customName';
}

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
