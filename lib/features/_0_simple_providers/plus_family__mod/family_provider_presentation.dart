import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '_2_plus_family_mod_gen.dart';
// import 'family_provider.dart';

class FamilyPage extends ConsumerWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloRoman = ref.watch(familyProvider(customName: 'Roman'));
    final helloGodun = ref.watch(familyProvider(customName: 'Godun'));
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
            // final helloGodun = ref.watch(helloProvider('Godun'));
            // return
            Text(helloGodun, style: textTheme.displayMedium
                // );
                // },
                ),
      ),
    );
  }
}
