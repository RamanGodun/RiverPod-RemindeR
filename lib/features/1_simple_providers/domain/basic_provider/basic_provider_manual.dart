import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

/*
📌 **Provider Info**
- This Provider is a simple "keep-alive" Provider.
- It **does not autoDispose**.
- The `onDispose` callback is never triggered; it stays in memory for the entire app session.
- Suitable for global configs, constants, or data meant to persist throughout the app.

👉 To force manual disposal or refresh:
  - Use `ref.invalidate(provider)` or `ref.refresh(provider)`.
*/
final appBarTextProviderManual = Provider<String>((ref) {
  ref.onDispose(() {
    debugPrint('🛑 [appBarTextProviderManual] was disposed');
  });
  return 'HI, friend ✋🏻😃';
});

final bodyTextProviderManual = Provider<String>((ref) {
  ref.onDispose(() {
    debugPrint('🛑 [bodyTextProviderManual] was disposed');
  });
  return 'This text is provided by simple KeepAlive Provider without code generation. Check with help of Logger it\'s lifecycle';
});
