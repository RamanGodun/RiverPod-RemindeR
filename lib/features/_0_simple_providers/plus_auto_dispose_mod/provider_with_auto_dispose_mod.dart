import 'package:flutter_riverpod/flutter_riverpod.dart';

final simpleManualProviderWithAutoDisposedMode = Provider.autoDispose<String>((
  ref,
) {
  print('Simple [autoDisposedProvider] was created');
  ref.onDispose(() {
    print('Simple [autoDisposedProvider] was disposed');
  });
  return 'Text from Provider with autodisposed modification and without code generation';
});
