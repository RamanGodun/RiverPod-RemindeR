import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart'; // Для debugPrint

final autoDisposeFamilyProvider = Provider.family.autoDispose<String, String>((
  ref,
  customizedText,
) {
  debugPrint('✅ [autoDisposeFamilyProvider] Created for "$customizedText"');

  ref.onDispose(() {
    debugPrint('🛑 [autoDisposeFamilyProvider] Disposed for "$customizedText"');
  });

  return '"$customizedText" from same family provider without code generation';
});
