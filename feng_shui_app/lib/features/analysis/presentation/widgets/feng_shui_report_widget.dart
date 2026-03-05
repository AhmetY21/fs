import 'package:flutter/material.dart';
import 'package:feng_shui_app/core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/analysis.dart';
import 'glass_card.dart';
import 'score_circle_widget.dart';
import 'violation_card_widget.dart';

class FengShuiReportWidget extends StatelessWidget {
  const FengShuiReportWidget({required this.analysis, super.key});
  final Analysis analysis;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ScoreSection(analysis: analysis, l10n: l10n),
        const SizedBox(height: 20),
        _CommandPositionSection(analysis: analysis, l10n: l10n),
        if (analysis.violations.isNotEmpty) ...[
          const SizedBox(height: 20),
          _ViolationsSection(analysis: analysis, l10n: l10n),
        ],
        if (analysis.positiveAspects.isNotEmpty) ...[
          const SizedBox(height: 20),
          _PositivesSection(analysis: analysis, l10n: l10n),
        ],
        const SizedBox(height: 20),
        _ElementBalanceSection(analysis: analysis, l10n: l10n),
        const SizedBox(height: 20),
        _ChiFlowSection(analysis: analysis, l10n: l10n),
      ],
    );
  }
}

class _ScoreSection extends StatelessWidget {
  const _ScoreSection({required this.analysis, required this.l10n});
  final Analysis analysis;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        children: [
          ScoreCircleWidget(score: analysis.overallScore),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _DetailChip(
                label: l10n.roomType,
                value: analysis.formattedRoomType,
              ),
              _DetailChip(
                label: l10n.chiFlow,
                value: analysis.chiFlow.quality,
                valueColor: _chiFlowColor(analysis.chiFlow.quality),
              ),
              _DetailChip(
                label: l10n.dominantElement,
                value: analysis.elementBalance.dominant,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _chiFlowColor(String quality) {
    return switch (quality) {
      'excellent' => AppColors.gradeAPlus,
      'good' => AppColors.gradeA,
      'moderate' => AppColors.gradeC,
      'poor' => AppColors.gradeD,
      'stagnant' => AppColors.gradeF,
      _ => AppColors.textSecondary,
    };
  }
}

class _DetailChip extends StatelessWidget {
  const _DetailChip({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.labelLarge.copyWith(
            color: valueColor ?? AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _CommandPositionSection extends StatelessWidget {
  const _CommandPositionSection({
    required this.analysis,
    required this.l10n,
  });
  final Analysis analysis;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final cp = analysis.commandPosition;
    final isGood = cp.isCommanding;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(
          icon: isGood ? Icons.check_circle : Icons.warning_amber,
          iconColor: isGood ? AppColors.gradeAPlus : AppColors.accentRed,
          title: l10n.commandPosition,
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: (isGood ? AppColors.gradeAPlus : AppColors.accentRed)
                .withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: (isGood ? AppColors.gradeAPlus : AppColors.accentRed)
                  .withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.commandPositionPrimary(cp.primaryFurniture),
                style: AppTextStyles.labelLarge,
              ),
              const SizedBox(height: 8),
              Text(
                cp.explanation,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ViolationsSection extends StatelessWidget {
  const _ViolationsSection({required this.analysis, required this.l10n});
  final Analysis analysis;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final sorted = List.of(analysis.violations)
      ..sort((a, b) => b.severity.compareTo(a.severity));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(
          icon: Icons.error_outline,
          iconColor: AppColors.accentRed,
          title: l10n.issuesFound(analysis.violations.length),
        ),
        const SizedBox(height: 8),
        ...sorted.map((v) => ViolationCardWidget(violation: v)),
      ],
    );
  }
}

class _PositivesSection extends StatelessWidget {
  const _PositivesSection({required this.analysis, required this.l10n});
  final Analysis analysis;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(
          icon: Icons.auto_awesome,
          iconColor: AppColors.accentGold,
          title: l10n.whatsWorkingWell,
        ),
        const SizedBox(height: 8),
        ...analysis.positiveAspects.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('✨ ', style: TextStyle(fontSize: 14)),
                Expanded(
                  child: Text(
                    p,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ElementBalanceSection extends StatelessWidget {
  const _ElementBalanceSection({required this.analysis, required this.l10n});
  final Analysis analysis;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final eb = analysis.elementBalance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(
          icon: Icons.balance,
          iconColor: AppColors.accentJade,
          title: l10n.fiveElementBalance,
        ),
        const SizedBox(height: 8),
        GlassCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InfoRow(label: l10n.dominant, value: eb.dominant),
              if (eb.missing.isNotEmpty)
                _InfoRow(label: l10n.missing, value: eb.missing.join(', ')),
              _InfoRow(label: l10n.suggestion, value: eb.suggestion),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChiFlowSection extends StatelessWidget {
  const _ChiFlowSection({required this.analysis, required this.l10n});
  final Analysis analysis;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(
          icon: Icons.waves,
          iconColor: AppColors.accentBlue,
          title: l10n.chiFlowAnalysis,
        ),
        const SizedBox(height: 8),
        Text(
          analysis.chiFlow.description,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.icon,
    required this.iconColor,
    required this.title,
  });

  final IconData icon;
  final Color iconColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 8),
        Text(title, style: AppTextStyles.titleMedium),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              '$label:',
              style: AppTextStyles.labelLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
