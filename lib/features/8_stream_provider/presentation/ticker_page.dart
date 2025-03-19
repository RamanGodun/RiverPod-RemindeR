import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/mini_widgets.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../ticker/ticker_provider.dart';

class TickerPage extends ConsumerWidget {
  const TickerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickerValue = ref.watch(tickerProvider);
    print(tickerValue);

    return Scaffold(
      appBar: AppBar(title: const TextWidget('Ticker', TextType.titleMedium)),
      body: Center(
        child: tickerValue.when(
          data:
              (ticks) => TextWidget(
                Helpers.formatTimer(ticks),
                TextType.headlineMedium,
              ),
          error: (e, st) => AppMiniWidgets(MWType.error, error: e.toString()),
          loading: () => const AppMiniWidgets(MWType.loading),
        ),
      ),
    );
  }
}
