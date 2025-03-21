import 'package:flutter/material.dart';
import '../../../core/ui/widgets/buttons/custom_button_4_go_router.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../../../core/domain/config/router/route_names.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TextWidget('Second', TextType.titleSmall)),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextWidget('Second Page', TextType.headlineMedium),
            SizedBox(height: 10),
            CustomButtonForGoRouter(
              title: 'View Second Details',
              routeName: RouteNames.secondDetails,
              pathParameters: {'id': '735'},
              queryParameters: {'tab': 'info'},
            ),
            SizedBox(height: 10),
            CustomButtonForGoRouter(title: 'No Where', routeName: '/nowhere'),
          ],
        ),
      ),
    );
  }
}
