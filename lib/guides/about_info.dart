/*
===============================
## Use Cases of Async NotifierProvider:

1. **Managing Complex States**:
   NotifierProvider enables efficient management of complex states that may contain various logic paths dependent on multiple factors.

2. **Asynchronous API Request Handling**:
   Through integration with asynchronous methods (Future, Stream), NotifierProvider allows handling API requests,
    working with states like "loading", "success", and "failure".

3. **Caching Successful States**:
   To improve UX, you can cache the last successful state to display previous data in case of an error.
   This helps avoid empty screens during request failures.

4. **Centralized Business Logic Management**:
   NotifierProvider allows extracting state management logic from the UI code into State Notifiers,
    improving the app's structure and making it more maintainable.

5. **Lifecycle Control**:
   The automatic disposal mechanism (`onDispose`) allows safe resource management and cleaning up providers when they are no longer needed.



## *Notifier vs ChangeNotifier**:
   NotifierProvider significantly outperforms ChangeNotifierProvider in performance, as Notifier is not recreated with every state change.
   This avoids the overhead of re-initialization and saves resources.
   Additionally, Notifier supports more advanced state management patterns, such as sealed classes or enum-like states.
===============================




===============================
## Advantages of NotifierProvider for API Requests:

1. **Seamless Integration with Asynchronous Operations**:
   NotifierProvider is ideal for managing states during API requests.
   It provides clear representation of all possible states: initial, loading, success, and failure.

2. **Smooth Error Handling**:
   With the ability to integrate error-handling logic, NotifierProvider allows simulating or realistically handling
   failures during API requests. This helps test different scenarios of server interaction.

3. **Caching the Last Successful State**:
   Using the last successful state in case of failures significantly improves user experience.
   This reduces the number of empty screens and allows the user to see at least previous data during network issues.

4. **Flexible Management of Asynchronous Requests**:
   You can use multiple different providers to manage various API requests within a single app,
   optimizing logic according to requirements.

5. **Automatic State Update when External Providers Change**:
   In cases where one provider depends on the state of another, NotifierProvider automatically recalculates the state
   when dependent providers change, ensuring smooth interaction.

===============================





class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotifierProvider'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: const [
            CustomButton(
              title: 'Counter',
              child: CounterPageOnNotifier(),
            ),
            CustomButton(
              title: 'Enum Activity',
              child: EnumActivityPage(),
            ),
            CustomButton(
              title: 'Sealed Activity',
              child: SealedActivityPage(),
            ),
            CustomButton(
              title: 'Ticker',
              child: TickerPage(),
            ),
            CustomButton(
              title: 'Todo',
              child: TodosPage(),
            )
          ],
        ),
      ),
    );
  }
}
*/
