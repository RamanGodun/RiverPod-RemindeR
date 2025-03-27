# 🚦 GoRouter Integration in Riverpod Apps

## 📌 Overview

**GoRouter** is a declarative routing package designed for Flutter that integrates seamlessly with **Riverpod** for reactive, 
modular navigation. It allows for dynamic route management, state-based redirection, and deeply nested routes with minimal boilerplate.

This guide provides a professional and practical walkthrough for implementing GoRouter in a Riverpod-powered Flutter app, covering:
- Persistent navigation using `StatefulShellRoute`
- Auth-based routing and redirects
- Parameter & query handling
- Clean code architecture with `Provider`-based route config

---

## 🧭 What is `ShellRoute` and Why Use It?

`ShellRoute` (and its enhanced form `StatefulShellRoute`) allows you to define a **persistent parent container**
 with shared UI elements such as a `BottomNavigationBar`, while **child routes update independently** inside it.

### ✅ Key Benefits:
- **Persistent UI**: Avoids reinitializing components like `BottomNavigationBar` on every tab switch
- **State Retention**: Maintains scroll position, provider state, and UI status between tabs
- **Riverpod Integration**: Shared providers across branches, or scoped overrides per route

### 🛠️ How it works:
- You define a `StatefulShellRoute.indexedStack` as a root route
- Inside it, declare `StatefulShellBranch`es for each tab or section
- Each branch can define its own nested `GoRoute`s

### ✅ Example
```dart
StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) => ScaffoldWithNavBar(navigationShell: navigationShell),
  branches: [
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/first',
          builder: (context, state) => const FirstPage(),
          routes: [
            GoRoute(
              path: 'details',
              builder: (context, state) => const FirstDetailsPage(),
            ),
          ],
        ),
      ],
    ),
    // Other branches...
  ],
)
```

---

## 🔐 Auth Guarding with Riverpod

### ✅ Step 1: `authStateProvider`
Manages auth state from `SharedPreferences`.
```dart
@riverpod
class AuthState extends _$AuthState {
  @override
  bool build() => ref.watch(sharedPreferencesProvider).getBool('auth') ?? false;

  Future<void> setAuthenticate(bool value) async {
    await ref.read(sharedPreferencesProvider).setBool('auth', value);
    state = value;
  }
}
```

### ✅ Step 2: `GoRouter` with `redirect`
Define `routeProvider` with conditional redirects:
```dart
@riverpod
GoRouter route(Ref ref) {
  final isAuthenticated = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/first',
    redirect: (context, state) {
      final atLogin = state.matchedLocation == '/signin';
      final atSignup = state.matchedLocation == '/signup';
      final isAuthPage = atLogin || atSignup;

      if (!isAuthenticated) return isAuthPage ? null : '/signin';
      if (isAuthPage) return '/first';
      return null;
    },
    routes: [
      GoRoute(path: '/signin', builder: (context, state) => const SigninPage()),
      GoRoute(path: '/signup', builder: (context, state) => const SignupPage()),
      // ShellRoute branches here
    ],
  );
}
```

---

## 🔄 Passing Parameters & Query Data

GoRouter supports:
- **Path Parameters** (`/details/:id`)
- **Query Parameters** (`?firstName=...&lastName=...`)

### ✅ In `router.dart`:
```dart
GoRoute(
  path: 'details/:id',
  builder: (context, state) {
    final id = state.pathParameters['id']!;
    final firstName = state.uri.queryParameters['firstName'] ?? 'Anonymous';
    final lastName = state.uri.queryParameters['lastName'] ?? 'Anonymous';

    return ThirdDetailsPage(id: id, firstName: firstName, lastName: lastName);
  },
)
```

### ✅ Helper to Navigate:
```dart
static void goTo(
  BuildContext context,
  String routeName, {
  Map<String, String> pathParameters = const {},
  Map<String, dynamic> queryParameters = const {},
}) {
  try {
    GoRouter.of(context).goNamed(
      routeName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  } catch (_) {
    GoRouter.of(context).go('/unknown');
  }
}
```

---

## 🚀 main.dart Setup with ProviderScope

```dart
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
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);

    return MaterialApp.router(
      routerConfig: router,
      theme: appTheme,
    );
  }
}
```

---

## 🎯 Summary of Best Practices

| Feature                        | Best Practice                                               |
|--------------------------------|-------------------------------------------------------------|
| Navigation structure           | Use `StatefulShellRoute.indexedStack` for tabs              |
| Auth routing                   | Use Riverpod `authStateProvider` + GoRouter `redirect`      |
| Parameters / queries           | Use `state.pathParameters` and `state.uri.queryParameters`  |
| State sharing                  | Use Riverpod providers across routes                        |
| Scoped state per route         | Use `ProviderScope` for overrides in subtrees               |
| Navigation helpers             | Abstract `.goNamed()` with a reusable `goTo(...)` method    |

---

> With this setup, your Flutter app powered by GoRouter + Riverpod becomes modular, scalable, and production-ready.

