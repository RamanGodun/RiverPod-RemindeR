import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/buttons/custom_button.dart';
import 'first_state_shape/ui_4_weather_app_with_first_state_shape.dart';
import 'second_state_shape/ui_4_weather_app_with_second_state_shape.dart';

class AsyncValuesPage extends StatelessWidget {
  const AsyncValuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Providers lifecycle page'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            /// 🚀 **кнопка переходу до модифікатори**
            CustomButton(
              title: 'to weather app with first SS',
              child: PageForWeatherAppWithFirstStateShape(),
            ),

            CustomButton(
              title: 'to providers override ex2',
              child: PageWeatherAppWithSecondStateShape(),
            ),

            ///
          ],
        ),
      ),
    );
  }
}
