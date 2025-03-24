# Handling `AsyncValue` in Riverpod: Two Syntactic Approaches & `skipLoadingOnRefresh` Insights

## 1️⃣ **Two Syntactic Approaches to Handling `AsyncValue`**

### A) **`.when()` Method**

#### ✅ **Advantages:**
- Clear separation of `data`, `loading`, and `error` states.
- Easily readable and explicit.
- Provides built-in support for additional parameters like `skipLoadingOnRefresh`.

#### 🔽 **Example Usage:**
```dart
body: userList.when(
  skipLoadingOnRefresh: false, // control refresh behavior
  data: (users) => ListView(...),
  error: (error, stTrace) => ErrorWidget(error),
  loading: () => LoadingIndicatorWidget(),
);
```

#### 🚀 **Best Use Case:**
- When you want explicit control over each state.
- Preferable for beginners and medium-complexity screens.
- Allows integration of optional parameters like `skipLoadingOnRefresh`.

---

### B) **`switch` Expression (Pattern Matching Syntax)**

#### ✅ **Advantages:**
- **Concise** & clean, especially for more compact widgets.
- Leverages Dart's modern pattern matching.

#### 🔽 **Example Usage:**
```dart
body: switch (userList) {
  AsyncData(:final value) => ListView(...),
  AsyncError(:final error) => ErrorWidget(error),
  _ => LoadingIndicatorWidget(),
};
```

#### 🚀 **Best Use Case:**
- Ideal for advanced developers familiar with Dart's newer features.
- Suitable for cases where brevity & readability are preferred.
- Cleaner syntax when the widget tree is minimal and straightforward.

---
