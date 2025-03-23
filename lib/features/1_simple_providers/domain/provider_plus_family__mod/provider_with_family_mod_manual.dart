import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart'; // For debugPrint

/*
 🏗️ Family Provider allows creating multiple **independent** instances of the same provider
 based on external parameters (like userId, name, filter, etc.).

 🟢 Key Points:
 - Each parameter creates a unique instance.
 - Useful when you need dynamic, parameterized state.
 - Keeps state alive for the whole app lifecycle.
 - Manual disposal is possible via `ref.invalidate()`.

 🎯 Typical Use Cases:
 - User-specific data.
 - Filtering lists.
 - Parameterized configurations.
*/

final simpleProviderWithFamilyModManual = Provider.family<String, String>((
  ref,
  customName,
) {
  debugPrint(
    '✅ [simpleProviderWithFamilyModManual] was created for "$customName"',
  );

  ref.onDispose(() {
    debugPrint(
      '🛑 [simpleProviderWithFamilyModManual] was disposed for "$customName"',
    );
  });

  return '"$customName", this text is also from simple Provider with family modification and got without code generation';
});
