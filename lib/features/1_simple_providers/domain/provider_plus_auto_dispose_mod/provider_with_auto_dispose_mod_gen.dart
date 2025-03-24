import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';

part 'provider_with_auto_dispose_mod_gen.g.dart';

/// 📄 **[autoDisposedModeWithSimpleGen] - AutoDispose Provider with Code Generation**
/// - This provider is **autoDisposed**:
///   - It is created when first needed.
///   - It is disposed immediately after no widgets are listening.

/// 🟢 **Use Case:**
/// Ideal for **temporary data/state**, such as:
/// - Loading indicators
/// - Short-lived UI components
/// - Views with frequently changing data

/// ⚙️ **Behavior:**
/// - No caching; resources are freed immediately when not used.
/// - Reduces memory footdebugPrint.

@riverpod
String autoDisposedModeWithSimpleGen(Ref ref) {
  /// 🛠️ **Lifecycle Logging:**
  debugPrint('✅ [autoDisposedModeWithSimpleGen] was created');
  ref.onDispose(() {
    debugPrint('🛑 [autoDisposedModeWithSimpleGen] was disposed');
  });

  return 'Text from Provider with autodisposed modification and with code generation. Check with help of Logger it\'s lifecycle';
}
