import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../domain/ticker/ticker_provider.dart';

class TickerOnStreamProviderPage extends ConsumerWidget {
  const TickerOnStreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickerValue = ref.watch(tickerProvider);
    debugPrint(tickerValue.toString());

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ticker on async stream provider'),
      body: Center(
        child: tickerValue.when(
          data:
              (ticks) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 25,
                  children: [
                    const TextWidget(
                      'Here is ticker (from 1 to 100 seconds), provided by Async Stream Provider with autoDispose modification.',
                      TextType.bodyLarge,
                      isTextOnFewStrings: true,
                    ),
                    TextWidget(
                      Helpers.formatTimer(ticks),
                      TextType.headlineMedium,
                    ),
                  ],
                ),
              ),

          ///
          error: (e, st) => AppMiniWidgets(MWType.error, error: e.toString()),
          loading: () => const AppMiniWidgets(MWType.loading),
        ),
      ),
    );
  }
}
