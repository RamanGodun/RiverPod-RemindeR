import 'package:flutter_riverpod/flutter_riverpod.dart';

final appBarTextProviderManual = Provider<String>((ref) {
  ref.onDispose(() {
    print('Simple keep alive Provider [wordsProvider] was disposed');
  });
  return 'HI, friend ✋🏻😃';
});

final bodyTextProviderManual = Provider<String>((ref) {
  ref.onDispose(() {
    print('[helloProvider] was disposed');
  });
  return 'This text is provided be simple KeepAlive Provider without code generation';
});
