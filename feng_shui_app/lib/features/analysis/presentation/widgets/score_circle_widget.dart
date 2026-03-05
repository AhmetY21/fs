import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:feng_shui_app/core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/score_calculator.dart';

class ScoreCircleWidget extends StatelessWidget {
  const ScoreCircleWidget({
    required this.score,
    this.size = 140,
    super.key,
  });

  final int score;
  final double size;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final grade = ScoreCalculator.getGrade(score);
    final label = _resolveLabel(l10n, grade.labelKey);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ScoreRingPainter(
          progress: score / 100,
          color: grade.color,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$score',
                style: AppTextStyles.displayMedium.copyWith(
                  color: grade.color,
                  fontSize: size * 0.22,
                  height: 1,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: size * 0.08,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                grade.grade,
                style: AppTextStyles.titleMedium.copyWith(
                  color: grade.color,
                  fontSize: size * 0.12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _resolveLabel(AppLocalizations l10n, String key) {
    return switch (key) {
      'gradeExcellent' => l10n.gradeExcellent,
      'gradeVeryGood' => l10n.gradeVeryGood,
      'gradeGood' => l10n.gradeGood,
      'gradeFair' => l10n.gradeFair,
      'gradeNeedsWork' => l10n.gradeNeedsWork,
      'gradePoor' => l10n.gradePoor,
      'gradeMajorIssues' => l10n.gradeMajorIssues,
      _ => key,
    };
  }
}

class _ScoreRingPainter extends CustomPainter {
  _ScoreRingPainter({required this.progress, required this.color});

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - 8) / 2;

    // Background ring
    final bgPaint = Paint()
      ..color = AppColors.borderSubtle
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawCircle(center, radius, bgPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ScoreRingPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
