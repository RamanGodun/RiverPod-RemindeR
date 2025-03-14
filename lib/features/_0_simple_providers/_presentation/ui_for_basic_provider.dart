import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/domain/utils_and_services/imports_selector.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';

class PageWithSimpleKeepAliveProvider extends ConsumerStatefulWidget {
  const PageWithSimpleKeepAliveProvider({super.key});

  @override
  ConsumerState<PageWithSimpleKeepAliveProvider> createState() =>
      _BasicPageState();
}

class _BasicPageState extends ConsumerState<PageWithSimpleKeepAliveProvider> {
  @override
  Widget build(BuildContext context) {
    final appBarText = ref.watch(appBarProvider);

    return Scaffold(
      appBar: AppBar(title: TextWidget(appBarText, TextType.bodyLarge)),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final bodyText = ref.watch(bodyTextProvider);
            return TextWidget(
              bodyText,
              TextType.bodyLarge,
              isTextOnFewStrings: true,
            );
          },
        ),
      ),
    );
  }
}
