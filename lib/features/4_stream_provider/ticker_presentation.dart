import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';
import '../../core/domain/config/app_config.dart';
import '../../core/domain/utils_and_services/helpers.dart';
import '../../core/presentation/widgets/mini_widgets.dart';
import '../../core/presentation/widgets/text_widget.dart';
import 'ticker_provider_manual.dart';
import 'ticker_provider_gen.dart'; // Use this in case of code generation

class Page4TickerOnStreamProvider extends ConsumerWidget {
  const Page4TickerOnStreamProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickerValue =
        AppConfig.isUsingCodeGeneration
            ? ref.watch(withGenTickerStreamProvider)
            : ref.watch(tickerProviderWithoutCodeGen);

    return Scaffold(
      appBar: const CustomAppBar(
        title:
            'Ticker (${AppConfig.isUsingCodeGeneration ? 'gen' : 'manual'} provider)',
      ),
      body: Center(
        child: tickerValue.when(
          data:
              (ticks) => ListView(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const TextWidget(
                    AppConfig.isUsingCodeGeneration
                        ? 'The ticker provider will be autoDisposed when you leave this page'
                        : 'The ticker will continue ticking without resetting even if you leave this page',
                    TextType.titleMedium,
                    isTextOnFewStrings: true,
                  ),
                  const SizedBox(height: 35),
                  TextWidget(
                    Helpers.formatTimer(ticks),
                    TextType.headlineSmall,
                  ),
                ],
              ),

          /// Display error widget if the Stream encounters an error
          error: (e, st) => AppMiniWidgets(MWType.error, error: e),

          /// Display loading widget while the Stream is still loading (initial state)
          loading: () => const AppMiniWidgets(MWType.loading),
        ),
      ),
    );
  }
}
