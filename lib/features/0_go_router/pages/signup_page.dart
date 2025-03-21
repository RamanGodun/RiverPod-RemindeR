import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/ui/widgets/buttons/custom_button_4_go_router.dart';
import '../../../core/domain/config/router/auth_state_provider.dart';
import '../../../core/domain/config/router/route_names.dart';
import '../../../core/ui/widgets/text_widget.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const TextWidget('Sign UP', TextType.titleSmall)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Custom Button for Sign Up
            CustomButtonForGoRouter(
              title: 'Sign UP',
              voidCallBack: () => _handleSignUp(ref),
            ),
            const SizedBox(height: 20.0),
            // Custom Button for navigation to Sign In
            const CustomButtonForGoRouter(
              title: 'Already a member? Sign IN!',
              routeName: RouteNames.signIn,
            ),
            const SizedBox(height: 20.0),
            // Custom Button for navigation to Second Page
            const CustomButtonForGoRouter(
              title: 'Second',
              routeName: RouteNames.second,
            ),
            const SizedBox(height: 20.0),
            // Custom Button for navigation to an invalid route
            const CustomButtonForGoRouter(
              title: 'No Where',
              routeName: '/nowhere',
            ),
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
