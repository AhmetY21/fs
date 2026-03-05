abstract final class ApiConstants {
  static const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:3000',
  );

  static const analyzeEndpoint = '/api/analyze';

  static const connectionTimeout = Duration(seconds: 30);
  static const receiveTimeout = Duration(seconds: 60);

  static const maxImageSizeMb = 10;
  static const maxImageSizeBytes = maxImageSizeMb * 1024 * 1024;

  static const allowedMimeTypes = [
    'image/jpeg',
    'image/png',
    'image/webp',
  ];
}
