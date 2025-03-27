/*
===============================
## About AsyncValue
`AsyncValue` is a sealed and immutable class designed to handle the state of asynchronous operations such as loading, success (data), or error.
- It ensures that both loading and error states are always properly managed, providing a consistent API for handling asynchronous events.
- `AsyncValue` exposes utilities to easily convert its state (data, loading, error) into widgets or objects, making it highly declarative.
- It allows you to access the result of asynchronous operations synchronously at any time, without awaiting future results.
- Being sealed and immutable means `AsyncValue` cannot be subclassed or modified, ensuring consistency, immutability, and thread-safety.

Key states:
- **loading**: Represents the state when the operation is in progress.
- **data**: Contains the result when the operation completes successfully.
- **error**: Represents any errors that occurred during the operation.
===============================

===============================
## StreamProvider
`StreamProvider` is similar to `FutureProvider` but is designed for handling streams of asynchronous data.
- A stream is essentially a sequence of asynchronous events (like "a set of futures"), allowing data to be emitted over time.
- The `StreamProvider` uses `AsyncValue` to manage the state of the stream, which could be `loading`, `data`, or `error`.
- Common use case: It is ideal when you need to constantly listen to data that updates over time,
such as real-time data from an API, sensor data, or live updates from a database.

Key differences from `FutureProvider`:
- **FutureProvider** resolves only once (returns a single value or error), whereas **StreamProvider** can emit multiple values over time.
- Stream-based logic is useful for tasks like tracking real-time data streams, where the state evolves over time.
===============================

===============================
## USE-CASEs
- **Real-time data streaming**: Ideal for applications that deal with live data, like chat applications, stock prices,
weather updates, or live sensor data.
- **Continuous read/write operations**: Useful when data needs to be fetched or written continuously from a source that changes over time,
 such as a database or file system.
- **Listening to changes in external sources**: For example, observing Firebase Firestore document snapshots,
where data can be updated by other users in real-time.
===============================

===============================
## Other important info
- **Performance considerations**: Since streams can potentially emit data continuously,
 ensure to properly manage subscriptions and disposal using `autoDispose`
 when appropriate. Failing to do so can lead to memory leaks or unnecessary performance overhead.
- **Error handling**: Use `StreamProvider`'s `error` state to gracefully handle stream errors (network issues, server errors)
and display meaningful UI feedback to users.
- **Combining providers**: You can combine multiple `StreamProvider` or mix with other providers to compose more complex logic,
 allowing different pieces of your app to react to different streams of data.
===============================
*/
