import '../../../../core/error/failures.dart';
import '../entities/analysis.dart';

abstract class AnalysisRepository {
  Future<Result<Analysis>> analyzeRoom({
    required String imageBase64,
    required String mimeType,
  });
}
