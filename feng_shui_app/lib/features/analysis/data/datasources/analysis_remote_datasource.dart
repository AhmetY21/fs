import 'package:dio/dio.dart';
import '../../../../core/network/api_constants.dart';
import '../../domain/entities/analysis.dart';

class AnalysisRemoteDataSource {
  const AnalysisRemoteDataSource(this._dio);
  final Dio _dio;

  Future<Analysis> analyzeRoom({
    required String imageBase64,
    required String mimeType,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiConstants.analyzeEndpoint,
      data: {
        'imageBase64': imageBase64,
        'mimeType': mimeType,
      },
    );

    final data = response.data;
    if (data == null || !data.containsKey('analysis')) {
      throw const FormatException('Invalid response format');
    }

    return Analysis.fromJson(data['analysis'] as Map<String, dynamic>);
  }
}
