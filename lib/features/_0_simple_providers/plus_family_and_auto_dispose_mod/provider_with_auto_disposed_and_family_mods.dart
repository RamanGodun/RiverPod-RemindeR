import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeFamilyProvider = Provider.family.autoDispose<String, String>((
  ref,
  customizedText,
) {
  print('[autoDisposeFamilyProvider] was created');
  ref.onDispose(() {
    print('[autoDisposeFamilyProvider] was disposed');
  });

  return '"$customizedText" from same family provider without code generation';
});
