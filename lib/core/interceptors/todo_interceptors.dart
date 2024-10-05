import 'package:dio/dio.dart';

import '/core/core.dart';
import '/domain/domain.dart';

class TodoInterceptor extends Interceptor {
  const TodoInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    /// Diğer tüm endpoint'ler için accessToken eklenir.
    final token = await getIt<IStorageRepository>().getToken();

    ///
    if (token != null && token.isNotEmpty) {
      /// Alınan token'ı Authorization header'ına ekle
      options.headers['Authorization'] = 'Bearer $token';
    }

    /// İstek devam etsin
    return handler.next(options);
  }

  /// [Response Interceptor:]
  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    /// Yanıt devam etsin
    return handler.next(response);
  }

  /// [Error Interceptor]
  /// Dio kütüphanesinden bir hata aldığında çağrılır.
  @override
  Future<void> onError(
    DioException dioException,
    ErrorInterceptorHandler handler,
  ) async {
    /// Diğer HTTP hataları için standart hata işleme devam eder.
    return handler.next(dioException);
  }
}
