import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/utils_and_services/helpers.dart';
import '../../../core/ui/widgets/buttons/custom_button_4_go_router.dart';
import '../../../core/ui/widgets/text_widget.dart';
import '../../../core/domain/config/router/auth_state_provider.dart';
import '../../../core/domain/config/router/route_names.dart';

class ThirdPage extends ConsumerWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const TextWidget('Third', TextType.titleSmall)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextWidget('Third Page', TextType.headlineMedium),
            const SizedBox(height: 10),
            // Custom Button to navigate to Third Details
            CustomButtonForGoRouter(
              title: 'View Third Details',
              voidCallBack: () => _handleViewThirdDetails(context),
            ),
            const SizedBox(height: 10),
            // Custom Button to navigate to Sign In
            const CustomButtonForGoRouter(
              title: 'Sign In',
              routeName: RouteNames.signIn,
            ),
            const SizedBox(height: 10),
            // Custom Button to handle Sign Out
            CustomButtonForGoRouter(
              title: 'Sign Out',
              voidCallBack: () => _handleSignOut(ref),
            ),
          ],
        ),
      ),
    );
  }

  /*
Recommendations:
1. Use pathParameters:
• To identify a resource.
• When parameters are required for the route.
2. Use queryParameters:
• For optional parameters.
• To filter, sort, and pass additional data.
 */

  // Method to handle navigation to third details page
  void _handleViewThirdDetails(BuildContext context) {
    Helpers.goTo(
      context,
      RouteNames.thirdDetails,
      pathParameters: {'id': '333'},
      queryParameters: {
        // 'firstName': 'Roman',
        'lastName': 'Godun',
      },
    );
  }

  // Method to handle sign out
  Future<void> _handleSignOut(WidgetRef ref) async {
    await ref.read(authStateProvider.notifier).setAuthenticate(false);
  }
}
