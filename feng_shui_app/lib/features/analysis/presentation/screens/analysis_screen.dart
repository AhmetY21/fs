import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../providers/analysis_provider.dart';
import '../widgets/feng_shui_report_widget.dart';
import '../widgets/glass_card.dart';
import '../widgets/image_picker_widget.dart';
import '../widgets/spatial_overlay_widget.dart';

class AnalysisScreen extends ConsumerWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(analysisProvider);
    final notifier = ref.read(analysisProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _SliverStepsBar(step: state.step, l10n: l10n, onReset: notifier.reset),
            if (state.hasError)
              _SliverErrorBanner(
                failure: state.failure!,
                l10n: l10n,
                onDismiss: notifier.clearError,
              ),
            if (state.step == AnalysisStep.upload ||
                state.step == AnalysisStep.analyzing)
              _SliverUploadSection(
                state: state,
                notifier: notifier,
                l10n: l10n,
              ),
            if (state.hasResult)
              _SliverResultsSection(state: state, l10n: l10n),
          ],
        ),
      ),
    );
  }
}

class _SliverStepsBar extends StatelessWidget {
  const _SliverStepsBar({
    required this.step,
    required this.l10n,
    required this.onReset,
  });

  final AnalysisStep step;
  final AppLocalizations l10n;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
        child: Row(
          children: [
            _StepIndicator(
              number: '1',
              label: l10n.stepUpload,
              isActive: step == AnalysisStep.upload,
              isDone: step == AnalysisStep.result,
            ),
            _StepDivider(),
            _StepIndicator(
              number: '2',
              label: l10n.stepAnalyze,
              isActive: step == AnalysisStep.analyzing,
              isDone: step == AnalysisStep.result,
            ),
            _StepDivider(),
            _StepIndicator(
              number: '3',
              label: l10n.stepReport,
              isActive: step == AnalysisStep.result,
              isDone: false,
            ),
            const Spacer(),
            if (step == AnalysisStep.result)
              TextButton.icon(
                onPressed: onReset,
                icon: const Icon(Icons.refresh, size: 18),
                label: Text(l10n.newAnalysis),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.accentGold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({
    required this.number,
    required this.label,
    required this.isActive,
    required this.isDone,
  });

  final String number;
  final String label;
  final bool isActive;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    final color = isActive || isDone
        ? AppColors.accentGold
        : AppColors.textMuted;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? AppColors.accentGold.withValues(alpha: 0.2)
                : Colors.transparent,
            border: Border.all(color: color, width: 1.5),
          ),
          alignment: Alignment.center,
          child: isDone
              ? Icon(Icons.check, size: 16, color: color)
              : Text(
                  number,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(color: color),
        ),
      ],
    );
  }
}

class _StepDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: AppColors.borderSubtle,
    );
  }
}

class _SliverErrorBanner extends StatelessWidget {
  const _SliverErrorBanner({
    required this.failure,
    required this.l10n,
    required this.onDismiss,
  });

  final Failure failure;
  final AppLocalizations l10n;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.accentRed.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.accentRed.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            const Icon(Icons.warning_amber, color: AppColors.accentRed, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                _localizeError(l10n, failure),
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, size: 18),
              color: AppColors.textMuted,
              onPressed: onDismiss,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }

  String _localizeError(AppLocalizations l10n, Failure failure) {
    return switch (failure) {
      NetworkFailure() => l10n.errorNetwork,
      RateLimitFailure() => l10n.errorRateLimit,
      ValidationFailure() => failure.message,
      ServerFailure() => l10n.errorAnalysisFailed,
      ParseFailure() => l10n.errorAnalysisFailed,
      UnknownFailure() => l10n.errorGeneric,
    };
  }
}

class _SliverUploadSection extends StatelessWidget {
  const _SliverUploadSection({
    required this.state,
    required this.notifier,
    required this.l10n,
  });

  final AnalysisState state;
  final AnalysisNotifier notifier;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList.list(
        children: [
          const SizedBox(height: 16),
          Text(l10n.uploadTitle, style: AppTextStyles.displaySmall),
          const SizedBox(height: 8),
          Text(l10n.uploadSubtitle, style: AppTextStyles.bodyMedium),
          const SizedBox(height: 24),
          ImagePickerWidget(
            imageFile: state.imageFile,
            onSourceSelected: notifier.pickImage,
            onRemove: notifier.reset,
            isDisabled: state.isAnalyzing,
          ),
          if (state.hasImage) ...[
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: state.isAnalyzing ? null : notifier.analyze,
                child: state.isAnalyzing
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.bgPrimary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(l10n.analyzingMessage),
                        ],
                      )
                    : Text('☯ ${l10n.analyzeButton}'),
              ),
            ),
          ],
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _SliverResultsSection extends StatelessWidget {
  const _SliverResultsSection({
    required this.state,
    required this.l10n,
  });

  final AnalysisState state;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final analysis = state.analysis!;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList.list(
        children: [
          const SizedBox(height: 8),
          // Spatial Map
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🗺️ ${l10n.spatialMapTitle}',
                  style: AppTextStyles.titleMedium,
                ),
                const SizedBox(height: 12),
                if (state.imageFile != null)
                  SpatialOverlayWidget(
                    imageFile: state.imageFile!,
                    elements: analysis.elements,
                    commandPosition: analysis.commandPosition,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Report
          Text(
            '📋 ${l10n.reportTitle}',
            style: AppTextStyles.titleMedium,
          ),
          const SizedBox(height: 12),
          FengShuiReportWidget(analysis: analysis),
          // Redesign prompt
          if (analysis.redesignPrompt.isNotEmpty) ...[
            const SizedBox(height: 20),
            _RedesignPromptCard(
              prompt: analysis.redesignPrompt,
              l10n: l10n,
            ),
          ],
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _RedesignPromptCard extends StatelessWidget {
  const _RedesignPromptCard({required this.prompt, required this.l10n});
  final String prompt;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🎨 ${l10n.redesignPromptTitle}',
            style: AppTextStyles.titleMedium,
          ),
          const SizedBox(height: 12),
          Text(
            prompt,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: prompt));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.promptCopied)),
                  );
                },
                icon: const Icon(Icons.copy, size: 16),
                label: Text(l10n.copyPrompt),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.redesignNote,
                  style: AppTextStyles.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
