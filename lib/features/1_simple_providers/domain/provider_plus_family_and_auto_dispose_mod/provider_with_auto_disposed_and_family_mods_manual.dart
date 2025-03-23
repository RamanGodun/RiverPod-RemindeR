import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart'; // For debugPrint

/// 🏗️ **AutoDispose Family Provider**
/// - Creates independent instances based on external parameters.
/// - Automatically disposed when no widget is using it.
///
/// 📌 **Key Points:**
/// - Each parameter creates a unique instance.
/// - Ideal for temporary, parameterized state.
/// - Good for filtering, pagination, user-specific data.
/// - Automatically frees resources when unused.
///
/// ⚠️ **Note:**
/// - For complex keys, override `==` & `hashCode` to avoid memory leaks.
/// - Libraries like `freezed`, `equatable` simplify this.

final autoDisposeFamilyProvider = Provider.family.autoDispose<String, String>((
  ref,
  customizedText,
) {
  debugPrint('✅ [autoDisposeFamilyProvider] Created for "$customizedText"');

  ref.onDispose(() {
    debugPrint('🛑 [autoDisposeFamilyProvider] Disposed for "$customizedText"');
  });

  return '"$customizedText" is get from the same provider with family modification and without help of code generation. Check with help of Logger it\'s lifecycle';
});
