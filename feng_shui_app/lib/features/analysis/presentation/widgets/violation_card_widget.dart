import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/violation.dart';

class ViolationCardWidget extends StatelessWidget {
  const ViolationCardWidget({required this.violation, super.key});
  final Violation violation;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final severityColor = _severityColor(violation.severity);
    final severityLabel = _severityLabel(l10n, violation.severity);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgGlass,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: severityColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Semantics(
                label: l10n.severityLabel(severityLabel, violation.severity),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (i) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(
                        Icons.circle,
                        size: 8,
                        color: i < violation.severity
                            ? severityColor
                            : AppColors.textMuted.withValues(alpha: 0.3),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                severityLabel,
                style: AppTextStyles.labelSmall.copyWith(
                  color: severityColor,
                ),
              ),
              const Spacer(),
              Text(
                violation.ruleId,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            violation.description,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('💡 ', style: TextStyle(fontSize: 14)),
              Expanded(
                child: Text(
                  violation.recommendation,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.accentJade,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _severityColor(int severity) {
    return switch (severity) {
      5 => AppColors.severityCritical,
      4 => AppColors.severityHigh,
      3 => AppColors.severityModerate,
      2 => AppColors.severityLow,
      _ => AppColors.severityMinor,
    };
  }

  String _severityLabel(AppLocalizations l10n, int severity) {
    return switch (severity) {
      5 => l10n.severityCritical,
      4 => l10n.severityHigh,
      3 => l10n.severityModerate,
      2 => l10n.severityLow,
      _ => l10n.severityMinor,
    };
  }
}
