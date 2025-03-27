import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_reminder/core/presentation/widgets/custom_app_bar.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/presentation/widgets/buttons/custom_button_4_go_router.dart';
import '../../../core/domain/config/router/auth_state_provider.dart';
import '../../../core/domain/config/router/route_names.dart';
import '../../../core/presentation/widgets/text_widget.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Sign UP page', isCenteredTitle: true),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///
            CustomButtonForGoRouter(
              title: '"Sign UP" in one click',
              onPressedCallback: () => _handleSignUp(ref),
            ),

            ///
            const CustomButtonForGoRouter(
              title: 'Go to Second page',
              routeName: RouteNames.secondPage,
            ),

            ///
            const CustomButtonForGoRouter(
              title: 'Go to non-existence route 😁',
              routeName: '/nowhere',
            ),

            ///
            TextButton(
              onPressed: () {
                Helpers.goTo(
                  context,
                  RouteNames.signInPage,
                  pathParameters: const {},
                  queryParameters: const {},
                );
              },
              child: const TextWidget(
                'Already a member? Sign IN!',
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

  // Method to handle the sign-up logic
  Future<void> _handleSignUp(WidgetRef ref) async {
    await ref.read(authStateProvider.notifier).setAuthenticate(true);
  }
}
