
 **autocompletion with help of 'Flutter Riverpod Snippets' extension in VSCode:** 
1. to generate "part 'basic_provider_gen.g.dart';" ---  you need to type 'rivp' and choose autocompletion
2. to create a simple keep alive Provider  --- 'riverpodKeepAlive' and choose autocompletion

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

