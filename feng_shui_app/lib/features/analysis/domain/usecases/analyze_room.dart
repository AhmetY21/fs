import '../../../../core/error/failures.dart';
import '../entities/analysis.dart';
import '../repositories/analysis_repository.dart';

class AnalyzeRoom {
  const AnalyzeRoom(this._repository);
  final AnalysisRepository _repository;

  Future<Result<Analysis>> call({
    required String imageBase64,
    required String mimeType,
  }) {
    return _repository.analyzeRoom(
      imageBase64: imageBase64,
      mimeType: mimeType,
    );
  }
}
