import 'package:flutter/material.dart';
import 'package:riverpod_project/widgets/custom_button.dart';
import '../../../widgets/text_widget.dart';
import '../config/router/route_names.dart';

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
            TextWidget('First Page', TextType.smallHeadline),
            SizedBox(height: 10),
            CustomButtonForGoRouter(
              title: 'View First Details',
              routeName: RouteNames.firstDetails,
            )
          ],
        ),
      ),
    );
  }
}
