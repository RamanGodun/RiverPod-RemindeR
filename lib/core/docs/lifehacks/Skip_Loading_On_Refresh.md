# ⚙️ `skipLoadingOnRefresh` Behavior & Best Practices in Riverpod

This guide provides a overview and recommendation set for handling `AsyncValue<T>` refresh behavior using `.when()` 
in **Flutter Riverpod**, with special focus on the `skipLoadingOnRefresh` parameter and its implications on UX.

---

## 🎯 What is `skipLoadingOnRefresh`?

`skipLoadingOnRefresh` is a named parameter in the `.when()` method of `AsyncValue<T>`. It determines how the UI behaves
 **during refresh** (e.g., after `ref.refresh()` or `ref.invalidate()`):
- **`false` (default)** → Triggers the `loading` builder even if previous data exists.
- **`true`** → Skips the loading builder and keeps displaying previous data while new data loads in the background.

---

## ✅ `skipLoadingOnRefresh: false`

### 🔹 Behavior:
- Always shows a **loading indicator** on refresh.
- Previous data is not displayed while loading.

### 🔹 Use When:
- Manual refresh actions (e.g. AppBar refresh button).
- Explicit UX feedback is required.
- You want the user to clearly know a new fetch is happening.

### 🔹 Example:
```dart
userList.when(
  skipLoadingOnRefresh: false,
  data: (users) => ..., 
  loading: () => CircularProgressIndicator(),
  error: (e, st) => ErrorWidget(...),
)
```

---

## ✅ `skipLoadingOnRefresh: true`

### 🔹 Behavior:
- Keeps showing **previous data** during refresh.
- No loading indicator displayed.

### 🔹 Use When:
- Using **`RefreshIndicator`** for pull-to-refresh.
- You want to avoid flickering or UI disruption.
- Frequent refresh scenarios or background refetches.

### 🔹 Example:
```dart
RefreshIndicator(
  onRefresh: () async {
    ref.invalidate(usersProvider);
  },
  child: userList.when(
    skipLoadingOnRefresh: true,
    data: (users) => ListView(...),
    loading: () => ..., // rarely called
    error: (e, st) => ...,
  ),
)
```

---

## 🆚 `.when()` vs Dart `switch (AsyncValue)`

| Syntax                    | Advantages                                 | Best For                         |
|---------------------------|--------------------------------------------|----------------------------------|
| `.when()`                 | Clear, explicit, `skipLoadingOnRefresh`    | Beginner-friendly, UI controls   |
| `switch (AsyncValue)`     | Concise, modern, fine-grained conditions   | Complex refresh/UI logic         |

---

## 🧪 `skipLoadingOnRefresh` Comparison

| Option      | Behavior                                                   | Recommended Usage                           |
|-------------|------------------------------------------------------------|---------------------------------------------|
| `false`     | Shows loading indicator, hides previous data               | AppBar button refreshes, clear UX           |
| `true`      | Shows old data, hides loading spinner during refresh       | Pull-to-refresh, background fetch, seamless |

---

## 📌 Final Recommendations

- ✅ Use `.when()` + `skipLoadingOnRefresh: false` when refresh is **user-triggered** (e.g., toolbar).
- ✅ Use `.when()` + `skipLoadingOnRefresh: true` when using **`RefreshIndicator`** to prevent UI flicker.
- ✅ Consider switching to `switch (value)` for **fine-grained refresh control**, e.g. custom refresh loaders over content.

> 🎯 For advanced UIs, combining both `.when()` and `switch` patterns offers full flexibility and maximum UX quality.