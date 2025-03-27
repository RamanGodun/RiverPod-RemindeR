# 📦 Immutable Models in Dart with `freezed`

`freezed` is the **de facto standard** for building immutable, type-safe, and JSON-serializable models in Dart.
 It's widely adopted in production Flutter apps and provides key advantages such as automatic equality,
 copyWith, deep immutability, and sealed class-like capabilities.

---

## ✅ Why Use `freezed`?

| Feature                   | Benefit                                                                 |
|---------------------------|-------------------------------------------------------------------------|
| 🔒 Immutable Classes      | Prevent unintended mutation of models                                   |
| 🧬 Deep Equality          | Compare object values, not references                                   |
| 🛠 `copyWith()`           | Easily create modified clones of objects                                |
| 🔄 `fromJson()`/`toJson()`| Built-in JSON serialization                                             |
| 📌 Pattern Matching       | Enables sealed-like behavior with `when`, `maybeWhen`, `map`, etc.      |

---

## 🧱 Basic Setup

1. **Add dependencies** to `pubspec.yaml`:

```yaml
dependencies:
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1

dev_dependencies:
  build_runner: ^2.4.6
  freezed: ^2.4.5
  json_serializable: ^6.7.1
```

2. **Create model file:** `user.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    String? email,
    String? phone,
  }) = _User;

  // Custom unnamed constructor for custom methods
  const User._();

  // Optional: Custom toString to reduce log clutter
  @override
  String toString() => 'User(id: $id, name: $name)';

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
```

3. **Run Code Generation:**

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 🔍 Features Breakdown

### ✅ Immutability
The generated class is deeply immutable. You **cannot change** any fields after creation.

### ✅ Equality and HashCode
```dart
final a = User(id: 1, name: 'Alice');
final b = User(id: 1, name: 'Alice');
print(a == b); // true ✅ (deep equality)
```

### ✅ `copyWith()`
```dart
final updated = a.copyWith(name: 'Bob');
```

### ✅ JSON Serialization
```dart
final json = user.toJson();
final userFromJson = User.fromJson(json);
```

---

## 🔄 Custom Methods
You can define custom logic using the private unnamed constructor:

```dart
const User._();

String get emailDomain => email?.split('@').last ?? '';
```

---

## 🧪 Tips for Clean Models

- Use `@Default(...)` for default values
- Add custom `toString()` for clearer logs
- Avoid exposing too many fields in logs (security & clarity)
- Use `.copyWith()` in state management
- Group models in `models/` folder

---

## 🧠 Summary

> `freezed` enables **safe, powerful, and scalable data modeling** for your Flutter apps.

- ✅ Immutable, type-safe, serializable models
- ✅ Cleaner code with less boilerplate
- ✅ Designed to work perfectly with Riverpod, Bloc, and other state management systems

---

🔗 [Freezed Documentation](https://pub.dev/packages/freezed)

📦 Make it your go-to tool for data modeling in modern Flutter apps.

