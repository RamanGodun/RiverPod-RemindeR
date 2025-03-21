import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/buttons/custom_button_4_go_router.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../../../core/domain/config/router/route_names.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Second page', isCenteredTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextWidget('This is Second page', TextType.titleMedium),
            SizedBox(height: 10),
            CustomButtonForGoRouter(
              title: 'To second branch subtree page',
              routeName: RouteNames.secondSubtreePage,
              pathParameters: {'id': '735'},
              queryParameters: {'tab': 'info'},
            ),
            SizedBox(height: 10),
            CustomButtonForGoRouter(
              title: 'Go to non-existence page',
              routeName: '/nowhere',
            ),
          ],
        ),
      ),
    );
  }
}
