import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/ui/widgets/custom_app_bar.dart';
import 'package:riverpod_reminder/core/ui/widgets/text_widget.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/buttons/custom_button_4_go_router.dart';
import '../../../core/domain/config/router/auth_state_provider.dart';
import '../../../core/domain/config/router/route_names.dart';

class SigninPage extends ConsumerWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Sign IN page', isCenteredTitle: true),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///
            CustomButtonForGoRouter(
              title: '"Sign IN" in one click',
              onPressedCallback: () => _handleSignIn(ref),
            ),

            ///
            const CustomButtonForGoRouter(
              title: 'Go to First page',
              routeName: RouteNames.firstPage,
            ),

            ///
            TextButton(
              onPressed: () {
                Helpers.goTo(
                  context,
                  RouteNames.signUpPage,
                  pathParameters: const {},
                  queryParameters: const {},
                );
              },
              child: const TextWidget(
                'Not a member? Sign UP!',
                TextType.bodyLarge,
                isUnderlined: true,
              ),
            ),

            ///
          ],
        ),
      ),
    );
  }

  /// Method to handle the sign-in logic
  Future<void> _handleSignIn(WidgetRef ref) async {
    await ref.read(authStateProvider.notifier).setAuthenticate(true);
  }
}
