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
      appBar: const CustomAppBar(title: 'Ticker on async stream '),
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
