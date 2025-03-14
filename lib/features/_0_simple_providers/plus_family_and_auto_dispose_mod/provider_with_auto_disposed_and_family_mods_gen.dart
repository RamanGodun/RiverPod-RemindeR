import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_with_auto_disposed_and_family_mods_gen.g.dart';

@riverpod
String autoDisposeFamily(Ref ref, {required String customizedText}) {
  print('[autoDisposeFamilyProvider($customizedText)] was created');
  ref.onDispose(() {
    print('[autoDisposeFamilyProvider($customizedText)] was disposed');
  });

  return '"$customizedText" from same family provider with code generation';
}
