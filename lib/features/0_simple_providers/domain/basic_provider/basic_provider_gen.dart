import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';

part 'basic_provider_gen.g.dart';

@Riverpod(keepAlive: true)
String appBarTextWithGen(Ref ref) {
  ref.onDispose(() {
    debugPrint('🛑 [appBarTextWithGen] was disposed');
  });
  return 'HI, friend ✋🏻😃';
}

@Riverpod(keepAlive: true)
String bodyTextWithGen(Ref ref) {
  ref.onDispose(() {
    debugPrint('🛑 [bodyTextWithGen] was disposed');
  });
  return 'This text is provided by simple KeepAlive Provider with code generation';
}
