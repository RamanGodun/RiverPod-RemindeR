import 'package:flutter/material.dart';
import 'package:riverpod_reminder/core/domain/app_constants/app_constants.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/buttons/custom_button_4_go_router.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../../../core/domain/config/router/route_names.dart';

class PageNotFound extends StatelessWidget {
  final String errMsg;

  const PageNotFound({super.key, required this.errMsg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Page not found',
        isCenteredTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                errMsg,
                TextType.error,
                isTextOnFewStrings: true,
                color: AppConstants.errorColor,
              ),

              const CustomButtonForGoRouter(
                title: 'Go to First page',
                routeName: RouteNames.firstPage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
