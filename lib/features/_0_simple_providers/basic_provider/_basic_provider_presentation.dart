import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/utils_and_services/helpers.dart';
import '../with_code_generation/_0_basic_provider_gen.dart';
// import 'basic_provider.dart';

class BasicPage extends ConsumerStatefulWidget {
  const BasicPage({super.key});

  @override
  ConsumerState<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends ConsumerState<BasicPage> {
  @override
  Widget build(BuildContext context) {
    final hello = ref.watch(helloProvider);
    final words = ref.watch(wordsProvider);
    final theme = Helpers.getTheme(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(words, style: textTheme.titleSmall),
      ),
      body: Center(
        child:
            // Consumer(
            // builder: (context, ref, child) {
            // final hello = ref.watch(helloProvider);
            // return
            Text(hello, style: textTheme.displayMedium
                // );
                // },
                ),
      ),
    );
  }
}
