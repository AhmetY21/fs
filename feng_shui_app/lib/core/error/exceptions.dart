class ServerException implements Exception {
  const ServerException({required this.message, this.statusCode});
  final String message;
  final int? statusCode;

  @override
  String toString() => 'ServerException($statusCode): $message';
}

class NetworkException implements Exception {
  const NetworkException([this.message = 'No internet connection']);
  final String message;

  @override
  String toString() => 'NetworkException: $message';
}

class RateLimitException implements Exception {
  const RateLimitException([this.message = 'Rate limit exceeded']);
  final String message;

  @override
  String toString() => 'RateLimitException: $message';
}
