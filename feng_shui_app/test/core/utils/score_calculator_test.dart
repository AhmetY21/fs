import 'package:flutter_test/flutter_test.dart';
import 'package:feng_shui_app/core/utils/score_calculator.dart';
import 'package:feng_shui_app/core/theme/app_colors.dart';

void main() {
  group('ScoreCalculator.calculate', () {
    test('returns 100 for no violations or positives', () {
      final score = ScoreCalculator.calculate(
        violationSeverities: [],
        positiveCount: 0,
        isCommanding: null,
      );
      expect(score, 100);
    });

    test('deducts correct weight for severity 5', () {
      final score = ScoreCalculator.calculate(
        violationSeverities: [5],
        positiveCount: 0,
        isCommanding: null,
      );
      expect(score, 85);
    });

    test('deducts correct weights for multiple violations', () {
      final score = ScoreCalculator.calculate(
        violationSeverities: [5, 4, 3],
        positiveCount: 0,
        isCommanding: null,
      );
      // 100 - 15 - 10 - 6 = 69
      expect(score, 69);
    });

    test('adds bonus for positive aspects', () {
      final score = ScoreCalculator.calculate(
        violationSeverities: [],
        positiveCount: 3,
        isCommanding: null,
      );
      // 100 + 9 = 109 clamped to 100
      expect(score, 100);
    });

    test('adds +10 for commanding position', () {
      final score = ScoreCalculator.calculate(
        violationSeverities: [5],
        positiveCount: 0,
        isCommanding: true,
      );
      // 100 - 15 + 10 = 95
      expect(score, 95);
    });

    test('deducts -10 for non-commanding position', () {
      final score = ScoreCalculator.calculate(
        violationSeverities: [5],
        positiveCount: 0,
        isCommanding: false,
      );
      // 100 - 15 - 10 = 75
      expect(score, 75);
    });

    test('clamps to minimum of 0', () {
      final score = ScoreCalculator.calculate(
        violationSeverities: [5, 5, 5, 5, 5, 5, 5, 5],
        positiveCount: 0,
        isCommanding: false,
      );
      // 100 - 120 - 10 = -30 clamped to 0
      expect(score, 0);
    });

    test('complex realistic scenario', () {
      final score = ScoreCalculator.calculate(
        violationSeverities: [5, 4, 3, 2],
        positiveCount: 4,
        isCommanding: true,
      );
      // 100 - 15 - 10 - 6 - 3 + 12 + 10 = 88
      expect(score, 88);
    });
  });

  group('ScoreCalculator.getGrade', () {
    test('returns A+ for score >= 90', () {
      final grade = ScoreCalculator.getGrade(95);
      expect(grade.grade, 'A+');
      expect(grade.color, AppColors.gradeAPlus);
      expect(grade.labelKey, 'gradeExcellent');
    });

    test('returns A for score >= 80', () {
      final grade = ScoreCalculator.getGrade(85);
      expect(grade.grade, 'A');
    });

    test('returns B for score >= 70', () {
      final grade = ScoreCalculator.getGrade(75);
      expect(grade.grade, 'B');
    });

    test('returns C+ for score >= 60', () {
      final grade = ScoreCalculator.getGrade(65);
      expect(grade.grade, 'C+');
    });

    test('returns C for score >= 50', () {
      final grade = ScoreCalculator.getGrade(55);
      expect(grade.grade, 'C');
    });

    test('returns D for score >= 40', () {
      final grade = ScoreCalculator.getGrade(45);
      expect(grade.grade, 'D');
    });

    test('returns F for score < 40', () {
      final grade = ScoreCalculator.getGrade(30);
      expect(grade.grade, 'F');
      expect(grade.labelKey, 'gradeMajorIssues');
    });

    test('boundary: 90 is A+', () {
      expect(ScoreCalculator.getGrade(90).grade, 'A+');
    });

    test('boundary: 89 is A', () {
      expect(ScoreCalculator.getGrade(89).grade, 'A');
    });
  });
}
