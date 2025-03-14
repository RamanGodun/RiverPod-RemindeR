import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';
import '../../../core/domain/utils_and_services/imports_selector.dart';

class PageWithSimpleAutoDisposedProvider extends ConsumerWidget {
  const PageWithSimpleAutoDisposedProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autoDisposeVariable = ref.watch(autoDisposedProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            TextWidget(
              autoDisposeVariable,
              TextType.bodyLarge,
              isTextOnFewStrings: true,
            ),
          ],
        ),
      ),
    );
  }
}
