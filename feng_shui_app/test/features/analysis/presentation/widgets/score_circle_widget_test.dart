import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:feng_shui_app/features/analysis/presentation/widgets/score_circle_widget.dart';

Widget _wrap(Widget child) {
  return MaterialApp(
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  group('ScoreCircleWidget', () {
    testWidgets('displays score number', (tester) async {
      await tester.pumpWidget(_wrap(const ScoreCircleWidget(score: 85)));
      await tester.pumpAndSettle();
      expect(find.text('85'), findsOneWidget);
    });

    testWidgets('displays grade for high score', (tester) async {
      await tester.pumpWidget(_wrap(const ScoreCircleWidget(score: 92)));
      await tester.pumpAndSettle();
      expect(find.text('A+'), findsOneWidget);
    });

    testWidgets('displays grade for low score', (tester) async {
      await tester.pumpWidget(_wrap(const ScoreCircleWidget(score: 25)));
      await tester.pumpAndSettle();
      expect(find.text('F'), findsOneWidget);
    });

    testWidgets('renders CustomPaint', (tester) async {
      await tester.pumpWidget(_wrap(const ScoreCircleWidget(score: 50)));
      await tester.pumpAndSettle();
      expect(find.byType(CustomPaint), findsWidgets);
    });
  });
}
