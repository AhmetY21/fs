import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';
import '../../data/datasources/analysis_remote_datasource.dart';
import '../../data/repositories/analysis_repository_impl.dart';
import '../../domain/entities/analysis.dart';
import '../../domain/usecases/analyze_room.dart';

// --- DI Providers ---

final analysisRemoteDataSourceProvider = Provider<AnalysisRemoteDataSource>(
  (ref) => AnalysisRemoteDataSource(ref.watch(dioProvider)),
);

final analysisRepositoryProvider = Provider<AnalysisRepositoryImpl>(
  (ref) => AnalysisRepositoryImpl(ref.watch(analysisRemoteDataSourceProvider)),
);

final analyzeRoomUseCaseProvider = Provider<AnalyzeRoom>(
  (ref) => AnalyzeRoom(ref.watch(analysisRepositoryProvider)),
);

// --- State ---

enum AnalysisStep { upload, analyzing, result }

class AnalysisState {
  const AnalysisState({
    this.step = AnalysisStep.upload,
    this.imageFile,
    this.imageBase64,
    this.imageMimeType,
    this.analysis,
    this.failure,
  });

  final AnalysisStep step;
  final File? imageFile;
  final String? imageBase64;
  final String? imageMimeType;
  final Analysis? analysis;
  final Failure? failure;

  bool get hasImage => imageFile != null;
  bool get isAnalyzing => step == AnalysisStep.analyzing;
  bool get hasResult => step == AnalysisStep.result && analysis != null;
  bool get hasError => failure != null;

  AnalysisState copyWith({
    AnalysisStep? step,
    File? imageFile,
    String? imageBase64,
    String? imageMimeType,
    Analysis? analysis,
    Failure? failure,
    bool clearImage = false,
    bool clearAnalysis = false,
    bool clearFailure = false,
  }) {
    return AnalysisState(
      step: step ?? this.step,
      imageFile: clearImage ? null : (imageFile ?? this.imageFile),
      imageBase64: clearImage ? null : (imageBase64 ?? this.imageBase64),
      imageMimeType: clearImage ? null : (imageMimeType ?? this.imageMimeType),
      analysis: clearAnalysis ? null : (analysis ?? this.analysis),
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }
}

// --- Notifier ---

class AnalysisNotifier extends StateNotifier<AnalysisState> {
  AnalysisNotifier(this._analyzeRoom) : super(const AnalysisState());

  final AnalyzeRoom _analyzeRoom;

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: source,
      maxWidth: 2048,
      maxHeight: 2048,
      imageQuality: 85,
    );

    if (picked == null) return;

    final file = File(picked.path);
    final bytes = await file.readAsBytes();

    if (bytes.length > ApiConstants.maxImageSizeBytes) {
      state = state.copyWith(
        failure: const ValidationFailure('Image is too large. Maximum size is 10 MB.'),
        clearAnalysis: true,
      );
      return;
    }

    final mimeType = _getMimeType(picked.path);
    if (!ApiConstants.allowedMimeTypes.contains(mimeType)) {
      state = state.copyWith(
        failure: const ValidationFailure('Invalid image type. Use JPEG, PNG, or WebP.'),
        clearAnalysis: true,
      );
      return;
    }

    state = AnalysisState(
      step: AnalysisStep.upload,
      imageFile: file,
      imageBase64: base64Encode(bytes),
      imageMimeType: mimeType,
    );
  }

  Future<void> analyze() async {
    if (state.imageBase64 == null || state.imageMimeType == null) return;

    state = state.copyWith(
      step: AnalysisStep.analyzing,
      clearFailure: true,
    );

    final result = await _analyzeRoom(
      imageBase64: state.imageBase64!,
      mimeType: state.imageMimeType!,
    );

    if (result.failure != null) {
      state = state.copyWith(
        step: AnalysisStep.upload,
        failure: result.failure,
      );
    } else {
      state = state.copyWith(
        step: AnalysisStep.result,
        analysis: result.data,
      );
    }
  }

  void reset() {
    state = const AnalysisState();
  }

  void clearError() {
    state = state.copyWith(clearFailure: true);
  }

  String _getMimeType(String path) {
    final ext = path.split('.').last.toLowerCase();
    return switch (ext) {
      'jpg' || 'jpeg' => 'image/jpeg',
      'png' => 'image/png',
      'webp' => 'image/webp',
      _ => 'image/jpeg',
    };
  }
}

final analysisProvider =
    StateNotifierProvider<AnalysisNotifier, AnalysisState>((ref) {
  return AnalysisNotifier(ref.watch(analyzeRoomUseCaseProvider));
});
