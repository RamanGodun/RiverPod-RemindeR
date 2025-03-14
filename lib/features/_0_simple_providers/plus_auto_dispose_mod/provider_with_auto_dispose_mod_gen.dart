import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_with_auto_dispose_mod_gen.g.dart';

@riverpod
String autoDisposedModeWithSimpleGen(Ref ref) {
  print('Simple [autoDisposedProvider] was created');

  ref.onDispose(() {
    print('Simple [autoDisposedProvider] was disposed');
  });

  return 'Text from Provider with autodisposed modification and with code generation';
}

