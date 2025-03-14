import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/utils_and_services/helpers.dart';
import '../with_code_generation/_1_plus_auto_dispose_mod_gen.dart';
// import 'auto_dispose_provider.dart';

class AutoDisposePage extends ConsumerWidget {
  const AutoDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autoDisposeVariable = ref.watch(autoDisposedProvider);
    final theme = Helpers.getTheme(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          style: textTheme.bodySmall,
          autoDisposeVariable,
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              style: textTheme.headlineLarge,
              textAlign: TextAlign.center,
              autoDisposeVariable,
            ),
          ],
        ),
      ),
    );
  }
}
