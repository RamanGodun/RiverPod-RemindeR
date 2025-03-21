import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../features/0_go_router/pages/_1_first_subtree_page.dart';
import '../../../../features/0_go_router/pages/_1_first_page.dart';
import '../../../../features/0_go_router/pages/page_not_found.dart';
import '../../../../features/0_go_router/pages/__scaffold_with_nav_bar.dart';
import '../../../../features/0_go_router/pages/_2_second_details_page.dart';
import '../../../../features/0_go_router/pages/_2__second_page.dart';
import '../../../../features/0_go_router/pages/__0_signin_page.dart';
import '../../../../features/0_go_router/pages/__0_signup_page.dart';
import '../../../../features/0_go_router/pages/_3_third_details_page.dart';
import '../../../../features/0_go_router/pages/_3__third_page.dart';
import 'auth_state_provider.dart';
import 'route_names.dart';
import 'route_paths.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.firstPage,

    /// for reactive managing and routing in dependence on authentication we use "redirect"
    redirect: (context, state) {
      final authenticated = authState;
      final tryingSignin = state.matchedLocation == RoutePaths.signIn;
      final tryingSignup = state.matchedLocation == RoutePaths.signUp;
      final authenticating = tryingSignin || tryingSignup;

      /// checking is user authenticated and further logic
      if (!authenticated) return authenticating ? null : RoutePaths.signIn;
      if (authenticating) return RoutePaths.firstPage;
      return null;
    },

    /// !  ROUTES
    routes: [
      GoRoute(
        path: RoutePaths.signIn,
        name: RouteNames.signInPage,
        builder: (context, state) => const SigninPage(),
      ),
      GoRoute(
        path: RoutePaths.signUp,
        name: RouteNames.signUpPage,
        builder: (context, state) => const SignupPage(),
      ),

      /// ! Indexed routes with SHELL-ROUTE
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          //
          /// * First branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.firstPage,
                name: RouteNames.firstPage,
                builder: (context, state) => const FirstPage(),
                routes: [
                  GoRoute(
                    path: RoutePaths.firstSubtreePage,
                    name: RouteNames.firstSubtreePage,
                    builder: (context, state) => const FirstDetailsPage(),
                  ),
                ],
              ),
            ],
          ),

          /// * Second branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.secondPage,
                name: RouteNames.secondPage,
                builder: (context, state) => const SecondPage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey:
                        _rootNavigatorKey, // * this is to put page ABOVE NAVIGATION BAR
                    path: RoutePaths.secondSubtreePage,
                    name: RouteNames.secondSubtreePage,
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return SecondDetailsPage(id: id);
                    },
                  ),
                ],
              ),
            ],
          ),

          /// * Third branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.thirdPage,
                name: RouteNames.thirdPage,
                builder: (context, state) => const ThirdPage(),
                routes: [
                  GoRoute(
                    path: RoutePaths.thirdSubtreePage,
                    name: RouteNames.thirdSubtreePage,
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

    /// Error page for invalid routes
    errorBuilder:
        (context, state) => PageNotFound(errMsg: state.error.toString()),
  );
}
