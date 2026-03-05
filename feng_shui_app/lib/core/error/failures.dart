sealed class Failure {
  const Failure(this.message);
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error']);
  final int? statusCode = null;
}

class RateLimitFailure extends Failure {
  const RateLimitFailure([super.message = 'Rate limit exceeded']);
}

class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Validation error']);
}

class ParseFailure extends Failure {
  const ParseFailure([super.message = 'Failed to parse response']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unknown error occurred']);
}

typedef Result<T> = ({T? data, Failure? failure});

Result<T> success<T>(T data) => (data: data, failure: null);
Result<T> failure<T>(Failure f) => (data: null, failure: f);
