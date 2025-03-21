import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart'; // Для debugPrint

part 'provider_with_auto_disposed_and_family_mods_gen.g.dart';

@riverpod
String autoDisposeFamily(Ref ref, String customizedText) {
  debugPrint('✅ [autoDisposeFamilyProvider] Created for "$customizedText"');

  ref.onDispose(() {
    debugPrint('🛑 [autoDisposeFamilyProvider] Disposed for "$customizedText"');
  });

  return '"$customizedText" from same family provider with code generation';
}
