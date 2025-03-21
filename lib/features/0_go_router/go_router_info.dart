/*
===============================

## Defining&Describing of SHELL-ROUTE

ShellRoute is a specialized route type in the GoRouter package that facilitates creating a persistent shared container for child routes. 
It preserves state and context when navigating between child routes. This makes it particularly useful for implementing navigation elements 
like BottomNavigationBar, Drawer, or a Persistent Tab Bar, which remain accessible regardless of the active child route.

! Key aspects of ShellRoute:

	1.	Persistent Container:
ShellRoute creates a widget that stays persistent across navigations between child routes. This avoids re-initializing components 
(e.g., navigation bars or shared elements) that should remain static when routes change.

	2.	Child Routes:
Child routes are defined inside the ShellRoute. They can access the shared context and state of the parent ShellRoute, 
enabling seamless interaction and efficient state management.

	3.	Application:
	•	Enables the creation of navigation components (e.g., TabBar, Drawer) that do not reload or reset when content changes.
	•	Simplifies the construction of multi-level routes with a clear and modular structure.

! How it works:

	1.	Container Creation:
ShellRoute creates a persistent container (e.g., MainShell), which houses shared UI elements such as BottomNavigationBar. 
This container remains static while the child (active child route) updates dynamically in Scaffold.body.

	2.	State Preservation:
When navigating between child routes (e.g., /home and /profile), the MainShell container does not reinitialize. 
This ensures state consistency and prevents unnecessary re-rendering.

	3.	RiverPod Integration:
	•	Shared State: Providers, like counterProvider, allow child routes to share and manage state seamlessly across the application.
	•	ProviderScope: If needed, child routes can use isolated state by defining local ProviderScope overrides.

! Benefits of using ShellRoute with RiverPod:

	•	Simplified State Management:
Centralized state handling makes it easier to manage complex navigation hierarchies.

	•	Efficient Resource Utilization:
Persistent containers (e.g., navigation bars) prevent redundant reinitializations, improving performance and user experience.

	•	State Flexibility:
Through ProviderScope, developers can choose between shared or isolated state management, depending on the specific use case.

===============================

===============================

?## Authorization and ensuring of access for authorized users

! 1. Auth Provider
The authStateProvider provider is responsible for tracking the authorization user state. 
The state is stored in SharedPreferences, allowing the authorization state to be persisted between sessions.

code is next:
"
part 'auth_state_provider.g.dart';
@riverpod
class AuthState extends _$AuthState {
  @override
  bool build() {
    return ref.watch(sharedPreferencesProvider).getBool('auth') ?? false;
  }

  Future<void> setAuthenticate(bool value) async {
    await ref.read(sharedPreferencesProvider).setBool('auth', value);
    state = value;
  }
}
"

! 2. main.dart: 
"
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);

    return MaterialApp.router(
      title: 'GoRouter with Riverpod',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routerConfig: router,
    );
  }
}
"

shared_preferences provider: 
"
part 'shared_pref_provider.g.dart';
@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}
"

! 3. router provider
Using redirect, GoRouter implements dynamic navigation:
• If the user is not authorized, all routes are redirected to /signin.
• Authorized users are automatically redirected from /signin or /signup to /first.
• Invalid routes are handled through errorBuilder, which allows you to display a PageNotFound page.
• Defines individual routes and their child routes. 
Parameters (e.g. :id) and queries (queryParameters) are supported to pass data between routes.
• StatefulShellRoute adds the ability to use a persistent container
 to implement navigation elements such as BottomNavigationBar

code is net:
"
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../pages/_1_first_details_page.dart';
import '../../pages/_1__first_page.dart';
import '../../pages/page_not_found.dart';
import '../../pages/_0_scaffold_with_nav_bar.dart';
import '../../pages/_2_second_details_page.dart';
import '../../pages/_2__second_page.dart';
import '../../pages/signin_page.dart';
import '../../pages/signup_page.dart';
import '../../pages/_3_third_details_page.dart';
import '../../pages/_3__third_page.dart';
import 'auth_state_provider.dart';
import 'route_names.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter route(Ref ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/first',
    // for reactive managing and routing in dependence on authentication we use "redirect"
    redirect: (context, state) {
      final authenticated = authState;
      final tryingSignin = state.matchedLocation == '/signin';
      final tryingSignup = state.matchedLocation == '/signup';
      final authenticating = tryingSignin || tryingSignup;

      // checking is user authenticated and further logic
      if (!authenticated) return authenticating ? null : '/signin';
      if (authenticating) return '/first';
      return null;
    },
    // ROUTES
    routes: [
      GoRoute(
        path: '/signin',
        name: RouteNames.signIn,
        builder: (context, state) {
          return const SigninPage();
        },
      ),
      GoRoute(
        path: '/signup',
        name: RouteNames.signup,
        builder: (context, state) {
          return const SignupPage();
        },
      ),
      // Indexed routes with SHELL-ROUTE
      // First branch
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/first',
                name: RouteNames.first,
                builder: (context, state) {
                  return const FirstPage();
                },
                routes: [
                  GoRoute(
                    path: 'details',
                    name: RouteNames.firstDetails,
                    builder: (context, state) {
                      return const FirstDetailsPage();
                    },
                  ),
                ],
              ),
            ],
          ),
          // Second branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/second',
                name: RouteNames.second,
                builder: (context, state) {
                  return const SecondPage();
                },
                routes: [
                  GoRoute(
                    parentNavigatorKey:
                        _rootNavigatorKey, //this is to put page ABOVE NAVIGATION BAR
                    path:
                        'details/:id', //":id" means we give id parameter, when go to this route
                    name: RouteNames.secondDetails,
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return SecondDetailsPage(id: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          // Third branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/third',
                name: RouteNames.third,
                builder: (context, state) {
                  return const ThirdPage();
                },
                routes: [
                  GoRoute(
                    path: 'details/:id',
                    name: RouteNames.thirdDetails,
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      final firstName =
                          state.uri.queryParameters['firstName'] ?? 'Anonymous';
                      final lastName =
                          state.uri.queryParameters['lastName'] ?? 'Anonymous';

                      return ThirdDetailsPage(
                        id: id,
                        firstName: firstName,
                        lastName: lastName,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    // Here widget, which will be displayed in case of invalid path §access
    errorBuilder: (context, state) => PageNotFound(
      errMsg: state.error.toString(),
    ),
  );
}
"

! 4. Use Helper method

static void goTo(
  BuildContext context,
  String routeName, {
  Map<String, String> pathParameters = const <String, String>{},
  Map<String, dynamic> queryParameters = const <String, dynamic>{},
}) {
  try {
    GoRouter.of(context).goNamed(
      routeName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  } catch (e) {
    GoRouter.of(context).go('/unknown');
  }
}

===============================

===============================

## Optimization,  transfer data through router provider

! 1. Code of router
GoRoute(
                path: '/third',
                name: RouteNames.third,
                builder: (context, state) {
                  return const ThirdPage();
                },
                routes: [
                  GoRoute(
                    path: 'details/:id',
                    name: RouteNames.thirdDetails,
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      final firstName =
                          state.uri.queryParameters['firstName'] ?? 'Anonymous';
                      final lastName =
                          state.uri.queryParameters['lastName'] ?? 'Anonymous';

                      return ThirdDetailsPage(
                        id: id,
                        firstName: firstName,
                        lastName: lastName,
                      );
                    },
                  ),
                ],
              )

! 2. Page code
class ThirdDetailsPage extends StatelessWidget {
  const ThirdDetailsPage({
    super.key,
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final String id;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
  ...


! LIFEHACK: in router in builder get "state" parameter 
for example: 
 final id = state.pathParameters['id']!;
                      final firstName =
                          state.uri.queryParameters['firstName'] ?? 'Anonymous';
                      final lastName =
                          state.uri.queryParameters['lastName'] ?? 'Anonymous';

! and then use it properties, when call another widget
for example: 
   return ThirdDetailsPage(
                        id: id,
                        firstName: firstName,
                        lastName: lastName,
                      );

===============================
 */
