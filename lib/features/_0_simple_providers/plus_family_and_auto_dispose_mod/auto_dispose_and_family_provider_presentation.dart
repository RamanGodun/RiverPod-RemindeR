import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '_3_plus_auto_dispose_family_mod.dart';
import '_auto_dispose_family_provider.dart';

class AutoDisposeFamilyPage extends ConsumerWidget {
  const AutoDisposeFamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloRoman =
        ref.watch(autoDisposeFamilyProvider(customName: 'Roman'));
    final helloGodun =
        ref.watch(autoDisposeFamilyProvider(customName: 'Godun'));

    ref.watch(counterProvider(const Counter(count: 0)));
    ref.watch(counterProvider(const Counter(count: 0)));

    final theme = Helpers.getTheme(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(helloRoman, style: textTheme.titleSmall),
      ),
      body: Center(
        child:
            // Consumer(
            // builder: (context, ref, child) {
            //  final helloGodun = ref.watch(autoDisposeFamilyHelloProvider('Godun'));
            // return
            Text(
          style: textTheme.displayMedium, textAlign: TextAlign.center,
          helloGodun,
          // );
          // },
        ),
      ),
    );
  }
}
