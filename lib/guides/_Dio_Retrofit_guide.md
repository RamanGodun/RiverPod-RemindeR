# 📡 Dio & Retrofit Integration Guide for Flutter Riverpod Apps

## 🎯 Goal

This guide provides a clean and scalable approach for integrating **Dio**, **Interceptors**, and **Retrofit** in a **Flutter + Riverpod** application. It follows best practices for modularity, debuggability, and testability.

------------------------------------------------------------------------------------------------------------------------

## 🏗 Recommended Architecture

```
core/
├── domain/
│   └── config/
│       └── dio_config.dart        // Dio instance & interceptors
├── providers/
│   └── dio_and_retrofit/
│       └── dio_providers/        // Riverpod providers for Dio & API clients
features/
├── <feature>/
│   └── data/
│       └── remote/               // Retrofit interfaces
│       └── models/               // DTOs
```

------------------------------------------------------------------------------------------------------------------------

## 🚀 Step 1: Setup Dio with Interceptors

```dart
// core/domain/config/dio_config.dart
import 'package:dio/dio.dart';

Dio createDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.example.com/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      responseType: ResponseType.json,
    ),
  );

  dio.interceptors.addAll([
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (log) => debugPrint(log),
    ),
    // Add custom interceptors (e.g., token refresh)
  ]);

  return dio;
}
```

------------------------------------------------------------------------------------------------------------------------

## 🧪 Step 2: Define Retrofit Interface

```dart
// features/weather/data/remote/weather_api.dart
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/weather_dto.dart';

part 'weather_api.g.dart';

@RestApi()
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  @GET('/weather')
  Future<WeatherDto> getWeather(@Query('city') String city);
}
```

Then run:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

------------------------------------------------------------------------------------------------------------------------

## 🧩 Step 3: Create Providers for Dio & API

```dart
// core/providers/dio_and_retrofit/dio_providers/weather_api_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/config/dio_config.dart';
import '../../../../features/weather/data/remote/weather_api.dart';

final dioProvider = Provider<Dio>((ref) => createDio());

final weatherApiProvider = Provider<WeatherApi>((ref) {
  final dio = ref.watch(dioProvider);
  return WeatherApi(dio);
});
```

------------------------------------------------------------------------------------------------------------------------

## 🛠️ Step 4: Use in AsyncNotifier or FutureProvider

```dart
// features/weather/domain/providers/future_weather_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/providers/dio_and_retrofit/dio_providers/weather_api_provider.dart';

part 'future_weather_provider.g.dart';

@riverpod
Future<WeatherDto> futureWeather(FutureWeatherRef ref) async {
  final api = ref.watch(weatherApiProvider);
  return api.getWeather('Kyiv');
}
```

------------------------------------------------------------------------------------------------------------------------

## ✅ Best Practices

| Practice | Description |
|---------|-------------|
| **Use interceptors** | For logging, token injection, error handling |
| **Avoid hardcoding base URLs** | Use `AppConfig` or `.env` files |
| **Group providers by domain** | Keep API clients modular and isolated |
| **Add retry interceptors** | Handle token expiration or network issues |
| **Model with Freezed** | Use `freezed` + `json_serializable` for DTOs |

------------------------------------------------------------------------------------------------------------------------

## 🔍 Optional: Token Interceptor Example

```dart
class AuthInterceptor extends Interceptor {
  final Reader read;

  AuthInterceptor(this.read);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await read(authTokenProvider.future);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
```

Attach it:
```dart
final dio = Dio();
dio.interceptors.add(AuthInterceptor(ref.read));
```

------------------------------------------------------------------------------------------------------------------------

## 🔁 Example Log from Interceptor
```json
{
  "request": {
    "method": "GET",
    "url": "https://api.example.com/weather?city=Kyiv"
  },
  "response": {
    "statusCode": 200,
    "data": {
      "temperature": 20,
      "condition": "Clear"
    }
  },
  "timestamp": "2025-03-27T15:40:00Z"
}
```

------------------------------------------------------------------------------------------------------------------------

## 📦 Required Dependencies

```yaml
dependencies:
  dio: ^5.8.0+1
  retrofit: ^4.4.2
  riverpod_annotation: ^2.6.1
  flutter_riverpod: ^2.6.1
  json_annotation: ^4.9.0

dev_dependencies:
  retrofit_generator: ^9.1.9
  build_runner: ^2.4.12
  json_serializable: ^6.9.0
```

------------------------------------------------------------------------------------------------------------------------

## 🧠 Summary

✅ Modular Dio setup with interceptors  
✅ Retrofit for declarative and testable API interfaces  
✅ Clean integration with Riverpod via providers  
✅ Debug-friendly with structured logs

Use this guide to build scalable and testable API clients in any Flutter project using Riverpod.









------------------------------------------------------------------------------------------------------------------------

## 🍕 Analogy: Ordering Pizza with Dio, Retrofit, and Interceptors

Understanding **Dio**, **Retrofit**, and **Interceptors** can be confusing at first. 
Here's a beginner-friendly analogy comparing them to a food delivery process.

------------------------------------------------------------------------------------------------------------------------

### 🚚 Dio = The Delivery Driver
Dio is the **core HTTP client** responsible for making requests and receiving responses.

- Sends out requests to a server
- Handles responses (data, error, timeout, status codes)
- Think of Dio as the **delivery person** who goes to the restaurant and brings your food back.

> You say: "Please bring me a pizza from `https://pizza.com/menu/5` with extra cheese."

------------------------------------------------------------------------------------------------------------------------

### 📋 Retrofit = The Menu & Waiter
Retrofit is a **wrapper around Dio** that allows you to write clean, 
declarative API interfaces without building the request manually.

- You define methods like `getPizza(int id)`
- Retrofit constructs the correct HTTP request under the hood
- Think of Retrofit as the **menu** and the **waiter** who knows exactly how to place your order.

```dart
@GET('/menu/{id}')
Future<Pizza> getPizza(@Path('id') int id);
```

> You say: "I'd like item #5 from the menu," and Retrofit handles the rest.

------------------------------------------------------------------------------------------------------------------------

### 🛡️ Interceptors = Kitchen Security Manager
Interceptors act like a **filter or security manager** that watches every order:

- Add headers (e.g., tokens)
- Log requests/responses
- Modify request/response
- Handle global errors
- Cache or retry logic

> They ensure the driver has the right documents, checks for allergens, 
or adds discount coupons before the order leaves the kitchen.

------------------------------------------------------------------------------------------------------------------------

### 🧩 Summary Table

| Component       | Analogy              | Responsibility                             |
|-----------------|----------------------|--------------------------------------------|
| **Dio**         | Delivery driver      | Executes requests and receives responses   |
| **Retrofit**    | Menu + Waiter        | Defines what and how to order cleanly      |
| **Interceptors**| Security manager     | Modifies, validates, logs, or handles data |

------------------------------------------------------------------------------------------------------------------------

### 🔄 Interceptors vs Middleware

While they sound similar, **Interceptors** and **Middleware** are used in different contexts:

| Feature              | Interceptors (Dio)                     | Middleware (e.g., Server-side or Redux)          |
|----------------------|----------------------------------------|--------------------------------------------------|
| Usage Location       | Client-side (Flutter app)              | Server-side or state management layer            |
| Purpose              | Modify HTTP requests/responses         | Intercept action dispatch / server logic         |
| Example Use          | Attach auth token, retry failed call   | Modify actions, log Redux events                 |
| Applied To           | Network requests                       | Business logic flow or server routes             |

> In short: **Interceptors** intercept network traffic; **Middleware** intercepts application logic or actions.

------------------------------------------------------------------------------------------------------------------------


## 🧠 Conceptual Analogy: Interceptors vs Middleware

Understanding **Dio**, **Retrofit**, and **Interceptors** becomes much easier when we compare them to general concepts in software architecture.

------------------------------------------------------------------------------------------------------------------------

### **Are Interceptors like Middleware for HTTP?**

**Yes — that's a helpful analogy**, especially for beginners.

Think of it like this:

| Concept         | Analogy                                       | What it intercepts                                      |
|-----------------|-----------------------------------------------|---------------------------------------------------------|
| **Interceptor** | A middleware **inside the network layer**     | Network requests/responses                              |
| **Middleware**  | A middleware **inside the app's logic flow**  | Internal app actions, business logic, state transitions |

------------------------------------------------------------------------------------------------------------------------

### **More specifically:**

- **Interceptors** (e.g., in Dio or Retrofit):
  - Intercept and modify **HTTP requests/responses**.
  - Operate at three levels:
    - **Before** a request is sent (`onRequest`)
    - **After** a response is received (`onResponse`)
    - **On error** (`onError`)
  - **Common use cases:**
    - Adding auth tokens
    - Retrying failed requests
    - Logging headers or payloads

- **Middleware** (e.g., in Redux, Bloc, or custom state flows):
  - Intercept and modify **internal app events or state transitions**.
  - Can pause, modify, forward, or cancel logic.
  - **Common use cases:**
    - App analytics tracking
    - Feature toggles
    - Auto-dispatching related actions

------------------------------------------------------------------------------------------------------------------------

### ✅ Summary:

> **Both Interceptors and Middleware are hooks into a process — just at different levels.**
> 
> - **Interceptors** sit in the **network request pipeline**.
> - **Middleware** sits in the **internal logic or state management pipeline**.

So yes — it’s correct and helpful to say:

> "**An Interceptor is like middleware for HTTP. Middleware is like an interceptor for app logic.**"

------------------------------------------------------------------------------------------------------------------------