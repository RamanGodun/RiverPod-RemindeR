# 📋 Riverpod Snippets Guide for VSCode

This guide documents all available **VSCode snippets** used in the Riverpod Reminder project via the **Flutter Riverpod Snippets** extension. These shortcuts significantly speed up development by auto-generating boilerplate for providers, Freezed classes, part files, and more.

---

## 🚀 Snippet Reference

### 🧠 Provider Generation

| Shortcut          | Description                                                    |
|------------------|----------------------------------------------------------------|
| `rivp`           | Generates `part 'xyz.g.dart';` for Riverpod codegen files       |
| `riverpodKeepAlive` | Creates a `Provider` with `ref.keepAlive()`                    |

---

### 🧊 Freezed + JsonSerializable

| Shortcut          | Description                                                    |
|------------------|----------------------------------------------------------------|
| `ptf`            | Inserts `part 'xyz.freezed.dart';`                               |
| `pts`            | Inserts `part 'xyz.g.dart';`                                     |
| `fdata`          | Generates full Freezed data class                               |
| `fromJson`       | Inserts factory constructor `factory XYZ.fromJson(...)`         |

---

### 📦 Common Patterns & Utilities (Planned additions)

_You can extend the snippet set with:_

| Shortcut          | Description                                                    |
|------------------|----------------------------------------------------------------|
| `riva`            | `AsyncNotifier` + `@riverpod` + build() pattern                 |
| `rivf`            | `FutureProvider` base structure                                |
| `rivs`            | `StateNotifier` base structure                                 |
| `watchRef`        | Common `ref.watch(...)` snippet                                 |
| `listenRef`       | Common `ref.listen(...)` with `hasError` and `state != null`   |
| `disposeRef`      | Adds `ref.onDispose(...)`                                       |
| `cancelRef`       | Adds `ref.onCancel(...)`                                        |

---

## 🧩 Tip:
To explore all available Riverpod or Freezed snippets in VSCode, open the **Command Palette** → `Insert Snippet` → search by prefix (e.g., `riv`, `pt`, `fdata`).

You can also customize or extend them in your VSCode via `Preferences → User Snippets`.