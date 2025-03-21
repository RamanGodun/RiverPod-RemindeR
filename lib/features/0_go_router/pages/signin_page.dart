import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_widget.dart';
import '../config/router/auth_state_provider.dart';
import '../config/router/route_names.dart';

class SigninPage extends ConsumerWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Sign IN', TextType.titleSmall),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Custom Button for Sign In
            CustomButtonForGoRouter(
              title: 'Sign IN',
              voidCallBack: () => _handleSignIn(ref),
            ),
            const SizedBox(height: 20.0),
            // Custom Button for navigation to Sign Up
            const CustomButtonForGoRouter(
              title: 'Not a member? Sign UP!',
              routeName: RouteNames.signup,
            ),
            const SizedBox(height: 20.0),
            // Custom Button for navigation to First Page
            const CustomButtonForGoRouter(
              title: 'First',
              routeName: RouteNames.first,
            ),
          ],
        ),
      ),
    );
  }

  // Method to handle the sign-in logic
  Future<void> _handleSignIn(WidgetRef ref) async {
    await ref.read(authStateProvider.notifier).setAuthenticate(true);
  }
}
