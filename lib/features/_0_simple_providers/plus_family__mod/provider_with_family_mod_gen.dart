import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_with_family_mod_gen.g.dart';

@Riverpod(keepAlive: true)
String simpleProviderWithFamilyModGen(Ref ref, {required String customName}) {
  ref.onDispose(() {
    print('[familyProvider($customName)] was disposed');
  });

  return '$customName, this text is from family Provider with code generation';
}
