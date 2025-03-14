import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_provider_gen.g.dart';

@Riverpod(keepAlive: true)
String appBarTextWithGen(Ref ref) {
  ref.onDispose(() {
    print('Simple keep alive [wordsProviders] was disposed');
  });
  return 'HI, friend ✋🏻😃';
}

@Riverpod(keepAlive: true)
String bodyTextWithGen(Ref ref) {
  ref.onDispose(() {
    print('Simple keep alive [helloProvider] was disposed');
  });
  return 'This text is provided be simple KeepAlive Provider with code generation';
}

