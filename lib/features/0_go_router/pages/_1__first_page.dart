import 'package:flutter/material.dart';
import '../../../core/ui/widgets/buttons/custom_button_4_go_router.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../../../core/domain/config/router/route_names.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('First page', TextType.titleSmall),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextWidget('First Page', TextType.headlineMedium),
            SizedBox(height: 10),
            CustomButtonForGoRouter(
              title: 'View First Details',
              routeName: RouteNames.firstDetails,
            ),
          ],
        ),
      ),
    );
  }
}
