import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart'; // Для debugPrint

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

  return '"$customName", this text is from family Provider without code generation';
});
