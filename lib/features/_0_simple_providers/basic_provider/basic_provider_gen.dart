import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_provider_gen.g.dart';

@Riverpod(keepAlive: true)
String appBar(Ref ref) {
  ref.onDispose(() {
    print('Simple keep alive [wordsProviders] was disposed');
  });
  return 'HI, friend ✋🏻😃';
}

@Riverpod(keepAlive: true)
String bodyText(Ref ref) {
  ref.onDispose(() {
    print('Simple keep alive [helloProvider] was disposed');
  });
  return 'This text is provided be simple KeepAlive Provider with code generation';
}

/*
 This provider (simple keep alive Provider) does not dispose automatically.
 The `onDispose` callback is never triggered because
 the provider stays in memory throughout the entire app run.

 Use this type of provider when you need to retain the state
 or data for the entire duration of the app lifecycle.

 This is suitable for global states or configurations that
 should persist as long as the app is running.

 If you want to manually dispose or refresh this provider,
 you can call `invalidate` or `refresh` through the `ref` object.
 */
