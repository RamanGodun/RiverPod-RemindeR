/// ⚙️ **[AppConfig] — Global app configuration flags**
/// Controls the usage of specific tools & patterns in the app.
class AppConfig {
  // ===============================
  // 🔄 Code Generation (Freezed, JsonSerializable, etc.)
  // ===============================
  static const bool isUsingCodeGeneration = true;

  // ===============================
  // 🟢 State Management Approach
  // true  => using StateNotifierProvider
  // false => using ChangeNotifierProvider
  // ===============================
  static const bool isUsingStateNotifierProvider = true;

  // ===============================
  // 🚦 Navigation Approach
  // false => NOT using GoRouter (default approach)
  // true  => Enables GoRouter navigation approach for testing/demo purposes
  // ===============================
  static const bool isUsingGoRouter = false;
}
