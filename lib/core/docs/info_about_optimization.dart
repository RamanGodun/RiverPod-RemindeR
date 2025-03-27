/*
===============================
## Optimization:

1. By using ProviderScope

Scopes – usages

1. Widget rebuild optimization
   - by removing parameters from Widget constructors ➔ const constructors 
?"by creating within ProviderScope the local state (provider)  for each item in itemList, which before was given in constructor of ListView.builder list"
local providers ensure "state isolation", that allows to work with each element independently 

2. Creating synchronous providers for normally async APIs (Firebase, SharedPreferences, etc)
   - by replacing the value that the synchronous providers return

3. Allowing Dialogs and Overlays to inherit the state of providers from the widget subtree that causes them to be shown
   - Riverpod allows you to create a ProviderScope that can access the state of all providers in a parent scope

4. Override the state of providers for a specific subtree (In majority cases can be replaced by family provider)
   - Use subtree scoping to make providers behave independently or differently in specific widget subtrees



===============================


===============================
## ! Influence of using "parent" parameter:
When calling showDialog or navigation methods in the HomePage4OverlayOptimization widget:
	1.	Without the parent parameter:
	•	Even if the parent widget MyHomePage overrides the provider using:
          ProviderScope(
            overrides: [
                 overlay_counter.counterProvider.overrideWith(
                 () => Counter100(),
                    )
                    ],
                    child: const HomePage4OverlayOptimization(),
                )

	•	The global context (from the ProviderScope in main.dart) is used.
	•	For example, the counterProvider value will be "0" (default value in the global context).

	2.	With the parent parameter in ProviderScope:
	•	The nearest local context (from the parent ProviderScope) is inherited.
	•	In this case:
	•	The counterProvider value will be "100", as overridden in MyHomePage.


===============================

===============================
## SUBTREE SCOPING

at first, look opportunity to avoid using it, by using separate provider or family provider(because subtree scoping is difficult)

===============================

## Local vs Global ProviderScope in Riverpod

### Core Idea
In Riverpod, **ProviderScope** is responsible for holding the state of all providers. There are two main ways to use it:

1. **Global ProviderScope (Default)**
2. **Local ProviderScope (Scoped to specific widgets/pages/dialogs)**

### Global ProviderScope

- **Definition:** The ProviderScope initialized at the root of the app (`main.dart`).
- **Behavior:**
  - Shared across the entire app.
  - All widgets access the same provider instances.
  - Disposing/rebuilding providers depends on widget lifecycle.

**⚠️ Problem:**
Dialogs, modals, or navigated pages **by default** use the global ProviderScope and won’t inherit any overridden values or custom scopes unless explicitly wrapped.

---

### Local ProviderScope

- **Definition:** A custom ProviderScope created inside widget trees, optionally with a `parent`.
- **Behavior:**
  - Allows overriding providers.
  - Manages its own lifecycle separate from the global scope.
  - Useful when you want localized state/data.

### Why Use Local ProviderScope?

| **Use Case**                                       | **Advantage**                                                                                               |
|---------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| Modals/Dialog windows                              | Allows them to inherit overridden provider values, keeping context-specific state.                         |
| Navigated pages                                   | Keeps separate state for specific navigation flows.                                                       |
| Testing                                           | Simplifies provider overrides in unit/widget tests.                                                       |
| Feature isolation (micro-frontends architecture)  | Scoped state management for independent feature modules.                                                  |

---

### Example: Dialog with Local ProviderScope

```dart
CustomButtonForDialog(
  title: 'Dialog (local context)',
  child: ProviderScope(
    parent: ProviderScope.containerOf(context),
    child: const AlertDialog(content: CounterDisplay()),
  ),
)
```

### Example: Page with Local ProviderScope

```dart
CustomButton(
  title: 'Page (local context)',
  child: ProviderScope(
    parent: ProviderScope.containerOf(context),
    child: const OtherPage(),
  ),
)
```

### Global vs Local Scope Behavior

| **Context**           | **State Sharing**                                | **Lifecycle**                                  |
|----------------------|--------------------------------------------------|------------------------------------------------|
| Global ProviderScope  | Shared across all widgets/pages/dialogs          | Managed globally (whole app lifecycle)         |
| Local ProviderScope   | Isolated within a specific widget tree           | Managed locally (disposed when widget removed) |

---

### Key Takeaways

- **Global ProviderScope**: Default, shared app-wide.
- **Local ProviderScope**: Scoped, overrides allowed, useful for dialogs, modals, separate pages, and test isolation.
- **Always wrap context-dependent widgets (dialogs, pages)** in a **local ProviderScope with parent context**, if state isolation or overrides are necessary.

### Common Pitfall

If you don’t use local ProviderScope in modals or navigated pages, they will fallback to the **global context**, potentially causing unintended state behavior or missing overrides.



 */
