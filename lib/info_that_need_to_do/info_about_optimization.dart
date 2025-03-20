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
 */
