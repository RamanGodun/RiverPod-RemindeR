import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart'; // Для debugPrint

final appBarTextProviderManual = Provider<String>((ref) {
  ref.onDispose(() {
    debugPrint('🛑 [appBarTextProviderManual] was disposed');
  });
  return 'HI, friend ✋🏻😃';
});

final bodyTextProviderManual = Provider<String>((ref) {
  ref.onDispose(() {
    debugPrint('🛑 [bodyTextProviderManual] was disposed');
  });
  return 'This text is provided by simple KeepAlive Provider without code generation';
});
