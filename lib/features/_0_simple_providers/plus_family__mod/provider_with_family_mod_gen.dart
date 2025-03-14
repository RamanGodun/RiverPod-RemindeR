import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart'; // Для debugPrint

part 'provider_with_family_mod_gen.g.dart';

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

  return '"$customName", this text is from family Provider with code generation';
}
