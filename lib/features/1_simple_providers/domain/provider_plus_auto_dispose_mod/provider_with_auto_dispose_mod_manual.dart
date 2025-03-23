import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart'; // For debugPrint

/// 📄 **[simpleManualProviderWithAutoDisposedMode] - AutoDispose Provider (Manual Version)**
/// - **AutoDispose:**
///   - Instantiated when first used.
///   - Disposed immediately when no widgets are listening.

/// 🟢 **Use Case:**
/// - Temporary or short-lived data.
/// - No need for caching.
/// - Examples:
///   - Loading indicators
///   - Quick API fetch results
///   - Transient UI components.

/// ⚙️ **Behavior:**
/// - Frees memory immediately after consumer stops.
/// - Lightweight & efficient.

final simpleManualProviderWithAutoDisposedMode = Provider.autoDispose<String>((
  ref,
) {
  /// 🛠️ **Lifecycle Logging:**
  debugPrint('✅ [simpleManualProviderWithAutoDisposedMode] was created');
  ref.onDispose(() {
    debugPrint('🛑 [simpleManualProviderWithAutoDisposedMode] was disposed');
  });

  return 'Text from Provider with autodisposed modification and without code generation. Check with help of Logger it\'s lifecycle';
});
