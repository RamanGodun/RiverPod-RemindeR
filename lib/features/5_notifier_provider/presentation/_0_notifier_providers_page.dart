import 'package:flutter/material.dart';

import '../../../core/ui/widgets/custom_button.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '_counter_presentation.dart';
import '_enum_activity_presentation.dart';
import '_sealed_activity_presentation.dart';

class NotifierProvidersPage extends StatelessWidget {
  const NotifierProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'Welcome to Simple Providers!',
          TextType.titleSmall,
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 30,
          children: [
            /// 🚀 **кнопка переходу до модифікатори**
            CustomButton(
              title: 'to page on enum state-shape (SS)',
              child: EnumActivityPage(),
            ),

            CustomButton(
              title: 'to page  on sealed class SS',
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
