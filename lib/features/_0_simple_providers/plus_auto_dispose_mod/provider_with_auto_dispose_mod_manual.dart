import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart'; // Для debugPrint

final simpleManualProviderWithAutoDisposedMode = Provider.autoDispose<String>((
  ref,
) {
  debugPrint('✅ [simpleManualProviderWithAutoDisposedMode] was created');
  
  ref.onDispose(() {
    debugPrint('🛑 [simpleManualProviderWithAutoDisposedMode] was disposed');
  });

  return 'Text from Provider with autodisposed modification and without code generation';
});