import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../error/exceptions.dart';
import 'api_constants.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectionTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(_ErrorInterceptor());

  return dio;
});

class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        throw const NetworkException('Connection timed out');

      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        final data = err.response?.data;
        final message = data is Map ? data['error'] as String? : null;

        if (statusCode == 429) {
          throw const RateLimitException();
        }

        throw ServerException(
          message: message ?? 'Server error',
          statusCode: statusCode,
        );

      case DioExceptionType.cancel:
        break;

      default:
        if (err.error.toString().contains('SocketException') ||
            err.error.toString().contains('HandshakeException')) {
          throw const NetworkException();
        }
        throw ServerException(message: err.message ?? 'Unknown error');
    }

    handler.next(err);
  }
}
