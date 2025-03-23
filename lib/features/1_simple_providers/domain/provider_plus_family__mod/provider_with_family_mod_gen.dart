import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart'; // For debugPrint

part 'provider_with_family_mod_gen.g.dart';

/*
 🏗️ Family Provider allows creating multiple **independent** instances of the same provider
 based on external parameters (like userId, name, filter, etc.).

 🟢 Key Points:
 - Each parameter creates a unique instance.
 - Useful when you need dynamic, parameterized state.
 - Keeps state alive for the whole app lifecycle if `keepAlive: true` is used.
 - Manual disposal is possible via `ref.invalidate()`.

 🎯 Typical Use Cases:
 - User-specific data.
 - Filtering lists.
 - Parameterized configurations.

*/

@Riverpod(keepAlive: true)
String simpleProviderWithFamilyModGen(Ref ref, String customName) {
  debugPrint(
    '✅ [simpleProviderWithFamilyModGen] was created for "$customName"',
  );

  ref.onDispose(() {
    debugPrint(
      '🛑 [simpleProviderWithFamilyModGen] was disposed for "$customName"',
    );
  });

  return '"$customName", this text is also from Provider with family mod and written with help of code generation';
}
