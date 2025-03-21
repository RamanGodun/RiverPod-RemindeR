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
