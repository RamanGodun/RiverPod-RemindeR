import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// 🔌 **[CustomInterceptor]** - Handles and logs HTTP requests, responses, and errors.
class CustomInterceptor extends Interceptor {
  /// 📤 Logs outgoing requests
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('➡️ Request: ${options.method} ${options.uri}');
    debugPrint('🔑 Headers: ${options.headers}');
    if (options.data != null) print('📦 Data: ${options.data}');
    super.onRequest(options, handler);
  }

  /// 📥 Logs incoming responses
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('✅ Response [${response.statusCode}]: ${response.data}');
    super.onResponse(response, handler);
  }

  /// ❌ Logs errors
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint('⛔️ Error [${err.response?.statusCode}]: ${err.message}');
    super.onError(err, handler);
  }
}
