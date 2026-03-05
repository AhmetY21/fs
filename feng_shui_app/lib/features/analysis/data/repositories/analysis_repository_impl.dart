import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/analysis.dart';
import '../../domain/repositories/analysis_repository.dart';
import '../datasources/analysis_remote_datasource.dart';

class AnalysisRepositoryImpl implements AnalysisRepository {
  const AnalysisRepositoryImpl(this._remoteDataSource);
  final AnalysisRemoteDataSource _remoteDataSource;

  @override
  Future<Result<Analysis>> analyzeRoom({
    required String imageBase64,
    required String mimeType,
  }) async {
    try {
      final analysis = await _remoteDataSource.analyzeRoom(
        imageBase64: imageBase64,
        mimeType: mimeType,
      );
      return success(analysis);
    } on NetworkException {
      return failure(const NetworkFailure());
    } on RateLimitException {
      return failure(const RateLimitFailure());
    } on ServerException catch (e) {
      if (e.statusCode == 400) {
        return failure(ValidationFailure(e.message));
      }
      return failure(ServerFailure(e.message));
    } on FormatException {
      return failure(const ParseFailure());
    } catch (_) {
      return failure(const UnknownFailure());
    }
  }
}
