import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';

import '../../../core/presentation/widgets/buttons/custom_button.dart';
import 'ui_4_counter_on_notifier_provider.dart';
import 'ui_4_activities_on_enum_based_state_shape_of_notifier_provider.dart';
import 'ui_4_activities_on_sealed_class_based_state_shape_of_notifier_provider.dart';

class NotifierProvidersPage extends StatelessWidget {
  const NotifierProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Notifier providers', isCenteredTitle: true),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            ///
            CustomButton(
              title: 'to page on enum state-shape (SS)',
              child: EnumActivityPage(),
            ),

            CustomButton(
              title: 'to page on sealed class SS',
              child: SealedActivityPage(),
            ),

            CustomButton(
              title: 'to counter on notifier',
              child: CounterPageOnNotifier(),
            ),
          ],
        ),
      ),
    );
  }
}
