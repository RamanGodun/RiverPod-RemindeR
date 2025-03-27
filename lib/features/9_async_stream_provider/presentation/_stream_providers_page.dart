import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';
import '../../../core/presentation/widgets/buttons/custom_button.dart';
import 'ticker_page.dart';
import 'timer_page.dart';

class Page4AsyncStreamProviders extends StatelessWidget {
  const Page4AsyncStreamProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Async Stream providers'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            ///
            CustomButton(
              title: 'to ticker page',
              child: TickerOnStreamProviderPage(),
            ),

            CustomButton(
              title: 'to timer page',
              child: Page4TimerOnStreamProvider(),
            ),
          ],
        ),
      ),
    );
  }
}
