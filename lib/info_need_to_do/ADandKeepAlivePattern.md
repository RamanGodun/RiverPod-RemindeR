# Riverpod `autoDispose + ref.keepAlive()` Pattern

## Overview

The `autoDispose + ref.keepAlive()` pattern in Riverpod allows fine-grained control over the lifecycle of providers. It provides a balance between freeing up memory when the provider is no longer used and keeping valuable cached data alive after successful fetching.

---

## When to Use

- **When using `autoDispose` providers to prevent memory leaks.**
- **When you want to cache the data temporarily after it was successfully fetched.**
- **When the provider depends on another `autoDispose` provider (like `dioProvider`).**

---

## Core Behavior

### `autoDispose`

- Automatically disposes of the provider when no longer used.
- Useful to free memory, but **clears all fetched data**.

### `ref.keepAlive()`

- Keeps the **fetched data alive** until the next time the provider is accessed.
- Still disposes provider logic, but cached data stays.
- Ideal for network requests, especially when navigating back to a page.

---

## Example: User Details Provider (Code Generated)

```dart
@riverpod
FutureOr<User> withCodeGenerationUserDetails(Ref ref, int id) async {
  ref.onDispose(() {
    print('[withCodeGenerationUserDetail($id)] disposed');
  });

  final response = await ref.watch(dioProvider).get('/users/$id');

  // Keeps the data alive after successful fetch
  ref.keepAlive();

  return User.fromJson(response.data);
}
```

---

## Example: Manual User Details Provider (Retrofit)

```dart
final userDetailsFutureProviderWithoutCodeGen = FutureProvider.autoDispose.family<
  User,
  int
>((ref, id) async {
  ref.onDispose(() {
    print('[userDetailsFutureProviderWithoutCodeGen($id)] disposed');
  });

  final apiClient = ref.watch(apiClientProvider);
  final user = await apiClient.getUser(id);

  // Keeps data cached after first fetch
  ref.keepAlive();

  return user;
});
```

---

## Behavior Explanation

### Why needed:
- **`dioProvider` is `autoDispose`**, so dependent providers must also be `autoDispose` to avoid unexpected disposal.
- But constant re-fetching **hurts UX**. So after initial successful fetch, we use:
  
  ```dart
  ref.keepAlive();
  ```

### Key points:

- If placed **AFTER** fetching → keeps successful data.
- If placed **BEFORE** fetching → keeps provider alive even during network delays.

---

## Difference from `keepAlive: true`

| `ref.keepAlive()`                           | `keepAlive: true`                  |
|--------------------------------------------|------------------------------------|
| Keeps data alive **after successful fetch**| Keeps provider alive **indefinitely** |
| More memory-friendly, on-demand            | Always alive, regardless of usage  |

---

## Typical Use Cases

- Pagination lists (cache previous pages)
- Detail pages where back-navigation is common
- API data fetch with retry logic

---

## Best Practices

1. **Always pair `autoDispose` + `ref.keepAlive()` when depending on another autoDispose provider.**
2. **Call `ref.keepAlive()` AFTER successful fetching to avoid unnecessary resource usage.**
3. **Combine with `onDispose()` for debugging lifecycle.**

---

## Summary

The `autoDispose + ref.keepAlive()` pattern gives flexibility:

- Reduces memory footprint.
- Caches already fetched data without keeping the provider logic unnecessarily alive.
- Smooth UX for data-driven apps, especially when combined with `dio`/`Retrofit`.





EXAMPLE
/*
<!-- import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/domain/state/dio_and_retrofit/dio_provider.dart';
import 'model/user.dart';

part 'user_details_future_provider_gen.g.dart';

@riverpod
FutureOr<User> withCodeGenerationUserDetails(Ref ref, int id) async {
  ref.onDispose(() {
    print('[withCodeGenerationUserDetail($id)] disposed');
  });

  // Fetch the details of a specific user by ID
  final response = await ref.watch(dioProvider).get('/users/$id');

  // return parsed and converted response  into a User object
  final user = User.fromJson(response.data);

  // ! dioProvider is autoDisposed, so this provider should also be autoDisposed.
  // !!! OR we can use "ref.keepAlive();" to cache the data and avoid disposal.
  ref.keepAlive(); // This keeps the data alive, allowing it to be cached.
  /*
  autoDispose + ref.keepAlive() pattern:
  - If the data is successfully fetched, it gets cached.
  - If an error occurs, it tries fetching again (without caching the error state).

  If "ref.keepAlive();" is placed before the data fetching, the data will be fetched
  in the background, even if the user navigates away from the page before the data is fetched.

  Before using `keepAlive`: If the user navigates to a page, and data isn't fetched yet,
  then immediately navigates away, the provider will be disposed.

  After using `keepAlive`: If the data is fetched at least once, it will be cached, even if the provider is disposed.

  ? Difference between "keepAlive: true" option:
  - `keepAlive: true` ensures that the provider stays alive indefinitely,
    whereas `ref.keepAlive()` only keeps the data alive until it is next needed and accessed.
  */

  return user;
} -->
*/