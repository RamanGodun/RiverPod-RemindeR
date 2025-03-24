
 **autocompletion with help of 'Flutter Riverpod Snippets' extension in VSCode:** 
1. to generate "part 'basic_provider_gen.g.dart';" ---  you need to type 'rivp' and choose autocompletion
2. to create a simple keep alive Provider  --- 'riverpodKeepAlive' and choose autocompletion
3. to create "part 'user.freezed.dart'"  debugPrint 'ptf' => and choose autocompletion
4. to create "part 'user.g.dart'" debugPrint 'pts' => and choose autocompletion
5. to create  freezed data class debugPrint 'fdata' => and choose autocompletion
6. to create factory fromJson debugPrint 'fromJson' => and choose autocompletion


!! Every time the provider A (from which depends a Provider B) changes, Provider B (even when it is marked as "keepAlive: true") is disposed and recreated. This will cause the provider B to rebuild every time the Provider A changes.


===============================
## StateProvider - Use Case
StateProvider is used when you need to save and manage a simple state, typically for lightweight state modifications.
- Avoid using it for heavy business logic. For that, use NotifierProvider.
- No code generation support for StateProvider.
===============================

===============================
## Notifier Property
Provides an instance of an object that holds the state and allows for modifications.
===============================

===============================
## StateController vs StateNotifier
- StateController: A subclass of StateNotifier that allows external modifications of its state. Use it for simple state changes.
- StateNotifier: Doesn't allow external state modifications. It’s better suited for complex logic handling.
===============================

===============================
## NotifierProvider
NotifierProvider is an enhanced version (recommended for use) of StateNotifierProvider
Its simplified alternative is StateProvider.
- NotifierProvider provides an instance of a Notifier class, so you need to create a Notifier class to handle the logic.
===============================

===============================
## Working with ref.watch, ref.listen, and ref.read inside providers
- Use ref.watch when you want to observe another provider's state.
- Use ref.listen for performing actions in response to state changes.
- Avoid using ref.read inside providers as it may lead to unpredictable behavior.
===============================

===============================
## Use Case Example
One StateProvider ("keepAlive: true") depends on another provider.
Each time the state of the dependent provider changes, the first provider is disposed and recreated.
===============================

===============================
## Family Provider
The Family provider allows for more reusable and dynamic code by treating the provider like a function.
===============================



# User Model - Freezed Documentation

## Використання Freezed:
- **Immutable клас.** Неможливо змінити поля після ініціалізації.
- **Equality & Hashing.** Порівняння об'єктів відбувається коректно.
- **CopyWith.** Легко клонувати об'єкт з новими параметрами.
- **fromJson / toJson.** Автоматична серіалізація/десеріалізація.

## Навіщо `const User._();`?
Цей приватний unnamed конструктор дозволяє:
- Створювати кастомні методи.
- Перевизначати методи (наприклад, `toString()`).

## Навіщо кастомний `toString()`?
Щоб при друці в консолі не засмічувати лог всіма полями (email, phone, website).


/*
📌 **Provider Info**
- This Provider is a simple "keep-alive" Provider.
- It **does not autoDispose**.
- The `onDispose` callback is never triggered; it stays in memory for the entire app session.
- Suitable for global configs, constants, or data meant to persist throughout the app.

👉 To force manual disposal or refresh:
  - Use `ref.invalidate(provider)` or `ref.refresh(provider)`.
*/



/*
 This provider (with auto dispose) mod is automatically created when needed
 and disposed as soon as no widget is using it.
! AutoDisposed Provider uses when there is no need of data cashing (when content of page doesn't change frequently/often )

 Use this provider for temporary data or state that
 does not need to persist throughout the entire app run.

 It is ideal for cases where you want to free up resources
 when the data is no longer in use, such as loading states,
 temporary views, or components with short lifecycles.

 When all consumers of this provider stop listening to it,
 the provider is disposed of, freeing any associated memory and resources.
 */