import 'package:flutter/material.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_widget.dart';
import '../config/router/route_names.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Second', TextType.titleSmall),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextWidget('Second Page', TextType.smallHeadline),
            SizedBox(height: 10),
            CustomButtonForGoRouter(
              title: 'View Second Details',
              routeName: RouteNames.secondDetails,
              pathParameters: {'id': '735'},
              queryParameters: {'tab': 'info'},
            ),
            SizedBox(height: 10),
            CustomButtonForGoRouter(
              title: 'No Where',
              routeName: '/nowhere',
            ),
          ],
        ),
      ),
    );
  }
}
