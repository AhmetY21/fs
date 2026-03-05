import 'dart:ui';
import '../theme/app_colors.dart';

class ScoreGrade {
  const ScoreGrade({
    required this.grade,
    required this.color,
    required this.labelKey,
  });

  final String grade;
  final Color color;
  final String labelKey;
}

abstract final class ScoreCalculator {
  static const _severityWeights = {5: 15, 4: 10, 3: 6, 2: 3, 1: 1};
  static const _positiveBonus = 3;

  static int calculate({
    required List<int> violationSeverities,
    required int positiveCount,
    required bool? isCommanding,
  }) {
    var score = 100;

    for (final severity in violationSeverities) {
      score -= _severityWeights[severity] ?? 5;
    }

    score += positiveCount * _positiveBonus;

    if (isCommanding != null) {
      score += isCommanding ? 10 : -10;
    }

    return score.clamp(0, 100);
  }

  static ScoreGrade getGrade(int score) {
    if (score >= 90) {
      return const ScoreGrade(
        grade: 'A+',
        color: AppColors.gradeAPlus,
        labelKey: 'gradeExcellent',
      );
    }
    if (score >= 80) {
      return const ScoreGrade(
        grade: 'A',
        color: AppColors.gradeA,
        labelKey: 'gradeVeryGood',
      );
    }
    if (score >= 70) {
      return const ScoreGrade(
        grade: 'B',
        color: AppColors.gradeB,
        labelKey: 'gradeGood',
      );
    }
    if (score >= 60) {
      return const ScoreGrade(
        grade: 'C+',
        color: AppColors.gradeCPlus,
        labelKey: 'gradeFair',
      );
    }
    if (score >= 50) {
      return const ScoreGrade(
        grade: 'C',
        color: AppColors.gradeC,
        labelKey: 'gradeNeedsWork',
      );
    }
    if (score >= 40) {
      return const ScoreGrade(
        grade: 'D',
        color: AppColors.gradeD,
        labelKey: 'gradePoor',
      );
    }
    return const ScoreGrade(
      grade: 'F',
      color: AppColors.gradeF,
      labelKey: 'gradeMajorIssues',
    );
  }
}
