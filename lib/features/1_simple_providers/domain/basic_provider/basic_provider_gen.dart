import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';

part 'basic_provider_gen.g.dart';

/*
📌 **Provider Info**
- This Provider is a simple "keep-alive" Provider.
- It **does not autoDispose**.
- The `onDispose` callback is never triggered; it stays in memory for the entire app session.
- Suitable for global configs, constants, or data meant to persist throughout the app.

👉 To force manual disposal or refresh:
  - Use `ref.invalidate(provider)` or `ref.refresh(provider)`.
*/
@Riverpod(keepAlive: true)
String appBarTextWithGen(Ref ref) {
  ref.onDispose(() {
    debugPrint('🛑 [appBarTextWithGen] was disposed');
  });
  return 'HI, friend ✋🏻😃';
}

@Riverpod(keepAlive: true)
String bodyTextWithGen(Ref ref) {
  ref.onDispose(() {
    debugPrint('🛑 [bodyTextWithGen] was disposed');
  });
  return 'This text is provided by simple KeepAlive Provider with code generation. Check with help of Logger it\'s lifecycle';
}
