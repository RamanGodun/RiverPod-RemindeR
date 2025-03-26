# Riverpod Reminder

## ✨ Project Overview

**Riverpod Reminder** is a structured and maintainable Flutter application designed as a personal **reference tool** and **interactive sandbox** for mastering **Riverpod**.
 It documents essential provider types, state modifiers, lifecycle behaviors, navigation patterns, and performance optimizations through **real-world mini-apps** and **hands-on examples**.

This app acts as a **developer utility** — especially useful for **intermediate to advanced Flutter developers** — helping to **recall**, **revisit**, 
or **solidify** knowledge of Riverpod’s core functionality.

   The app operates in two distinct modes configured via `AppConfig`:
> - **Standard Mode (`isUsingGoRouter = false`)**  
Displays a **dynamic homepage** with a dropdown list of 12 Riverpod topics. Upon selection, a single button navigates to the respective mini-app. 
This is powered by an enhanced enum-based navigation system.

> - **GoRouter Mode (`isUsingGoRouter = true`)**  
Launches a complete app that showcases **GoRouter + Riverpod** integration with: Auth guards, Named routes, Public/private route patterns


## 🏐 Purpose

This project serves as:

- A **quick-access reference** for revisiting Riverpod providers, patterns, and modifiers
- A **learning sandbox** to experiment with provider lifecycles and scoped overrides
- A **mini-app launcher** for testing isolated Riverpod features without clutter
- A **tool for onboarding or reviewing** Riverpod’s core concepts in a maintainable way

Whether preparing for a job interview, building internal tools, or conducting team onboarding — this app serves as a robust, hands-on **Riverpod knowledge base**.

---

## 🏠 Project Structure

### 🏢 `core/`

> Shared infrastructure, constants, configs, and UI utilities used across all features.

#### `core/domain/`

- **app_constants/**
  - `app_constants.dart`: Generic constants
  - `app_strings.dart`: Static UI strings

- **config/**
  - **observer/**: Custom logging observers for AsyncValues
  - **router/**: GoRouter config, route names/paths, auth provider
  - `app_config.dart`: Global switches for router mode, codegen, state approach

- **models/**
  - `activity_model/`, `product_model/`: Freezed models with serialization
  - `enums.dart`: App-wide enums (Cities, Features, etc.)

- **providers/**
  - **dio_and_retrofit/dio_providers/**: API clients per domain
  - **errors_handling/**: Error dialog simulation
  - **sh_prefs/**: SharedPreferences layer
  - `features_provider.dart`: Tracks current feature selection

- **utils_and_services/**
  - `helpers.dart`: Formatters, navigation helpers
  - `dialogs_service.dart`: Alert logic
  - **overlay/**: Custom UI overlays and notifications

#### `core/ui/`

> Centralized UI layer: theming, widgets, layout components

- **_theming/**
  - `app_theme.dart`: Light/Dark theme setup
  - `text_styles.dart`: Central typography
  - `theme_provider.dart`: Riverpod state manager for themes

- **pages/**
  - `home_page.dart`: Homepage with dynamic feature-based routing
  - `other_page.dart`: Placeholder/testing UI

- **widgets/**
  - **buttons/**
    - `custom_button.dart`, `custom_floating_button.dart`
    - `outlined.dart`: For standard secondary actions
    - `custom_button_4_go_router.dart`: Special button for GoRouter testing
    - `get_weather_button.dart`: Feature-specific action button
  - `custom_app_bar.dart`, `activity_widget.dart`, `custom_list_tile.dart`
  - `feature_selection_dialog.dart`: Dropdown feature picker dialog
  - `alert_dialog.dart`, `mini_widgets.dart`, `text_widget.dart`

---

### 🧰 Features

Each feature is located in `features/<index>_<feature_name>/`, fully modular and almost each one with separation into `domain/` and `presentation/`.

 ------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
| # | Feature              | Description                                                                                                                            |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 0 | **GoRouter**         | GoRouter navigation with guards, scoped auth, and stateful routing                                                                     |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 1 | **Simple Providers** | Demonstrates Provider, Provider.autoDispose, Provider.family, and Provider.autoDispose.family  using both manual and                   |
|   |                      | generated styles. Lifecycle behavior is observable   through logger integration and switching is handled via AppConfig.                | 
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 2 | **State Provider**   | Showcases `StateProvider`, `StateProvider.autoDispose`, `StateProvider.family`, and `StateProvider.autoDispose.family`.                |
|   |                      | Each modifier demonstrates different lifecycle and caching behavior. Includes dynamic reset, manual invalidation,                      |
|   |                      | critical state listening (with dialog alerts), and UI-driven background changes. Contains a creative mini-game to explore state logic. |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 3 | **Future Provider**  | Demonstrates `FutureProvider`, `FutureProvider.autoDispose`, `FutureProvider.family`, and `FutureProvider.autoDispose.family`.         |
|   |                      | Features list fetching, user details navigation, refresh indicators, caching via `ref.keepAlive()`, and selective invalidation.        |
|   |                      | Codegen/manual switching is handled via `AppConfig`, with lifecycle logging and UI-based loading/error states fully integrated.        |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 4 | **Stream Provider**  | Showcases `StreamProvider` with both `autoDispose` and `keepAlive` behavior depending on mode.                                         |
|   |                      | Ticker emits values every second using `Stream.periodic` with `.take(n)` logic. Includes lifecycle logging, UI formatting,             |
|   |                      | and disposal behavior comparison between manual and generated providers. Switching handled via `AppConfig`.                            |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 5 | **StateNotifier      | Compares mutable vs immutable state approaches using `ChangeNotifierProvider` and `StateNotifierProvider`.                             |
|   |         /            | Features a shared Todos UI, with dynamic switching via `AppConfig`.                                                                    |
|   |  ChangeNotifier**    | - `ChangeNotifier`: mutable list with direct mutation and `notifyListeners()`                                                          |
|   |                      | - `StateNotifier`: immutable list with `copyWith()` and explicit state replacement                                                     |
|   |                      | Demonstrates shared widgets, dynamic builder logic, and integration with hooks for input.                                              |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 6 | **Notifier Provider (Riverpod v2)** | Modern `Notifier` with enhanced syntax |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 7 | **Async Provider** | Async loading via `AsyncValue` and internal guards |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 8 | **AsyncNotifier Provider** | Refined logic separation with `AsyncNotifier` |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 9 | **AsyncStream Provider** | Async streams with buffering and UI binding |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
|10 | **Provider Lifecycle** | Cached data, scoped providers, keepAlive usage |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
|11 | **Performance Optimization** | ConsumerWidget usage, scoped rebuilds, and overrides |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
|12 | **Pagination** | Infinite and number-based pagination with Dio |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
|13 | **AsyncValues Handling** | Rich `AsyncValue` mapping with reusable builders |
|---|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|

---

## 📦 Tech Stack

- **Flutter** (Material 3)
- **Riverpod v2** (Codegen & Manual)
- **GoRouter** (optional via `AppConfig`)
- **Freezed** & **JsonSerializable**
- **Dio** (REST client)
- **Hooks**, **GetStorage**, **SharedPreferences**
- **Clean Architecture + Modularity**

---

## 🚀 Getting Started

1. Clone the repository:
git clone https://github.com/<your-username>/riverpod_reminder.git
```

2. Install dependencies:
flutter pub get
```

3. Run in GoRouter mode or Standard mode:
// In lib/core/domain/config/app_config.dart
static const bool isUsingGoRouter = true; // or false
```

4. Run the app:
flutter run
```



## 🔍 License

This project is licensed under the [MIT License](LICENSE).