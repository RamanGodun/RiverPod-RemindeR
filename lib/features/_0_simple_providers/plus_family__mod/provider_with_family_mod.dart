import 'package:flutter_riverpod/flutter_riverpod.dart';

final simpleProviderWithFamilyModManual = Provider.family<String, String>((ref, name) {
  ref.onDispose(() {
    print('[familyHelloProvider] was disposed');
  });
  return '$name, this text is from family Provider without code generation';
});

