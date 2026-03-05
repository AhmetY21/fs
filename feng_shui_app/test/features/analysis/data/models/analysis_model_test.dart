import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:feng_shui_app/features/analysis/domain/entities/analysis.dart';
import 'package:feng_shui_app/features/analysis/domain/entities/room_element.dart';
import 'package:feng_shui_app/features/analysis/domain/entities/violation.dart';
import 'package:feng_shui_app/features/analysis/domain/entities/command_position.dart';
import 'package:feng_shui_app/features/analysis/domain/entities/chi_flow.dart';
import 'package:feng_shui_app/features/analysis/domain/entities/element_balance.dart';

void main() {
  const sampleJson = '''
  {
    "room_type": "bedroom",
    "elements": [
      {
        "type": "bed",
        "label": "Double Bed",
        "position": {"x": 0.3, "y": 0.4},
        "size": {"w": 0.35, "h": 0.25}
      },
      {
        "type": "door",
        "label": "Main Door",
        "position": {"x": 0.05, "y": 0.1},
        "size": {"w": 0.08, "h": 0.2}
      }
    ],
    "command_position": {
      "primary_furniture": "bed",
      "is_commanding": true,
      "explanation": "The bed has a clear view of the door."
    },
    "violations": [
      {
        "rule_id": "mirror_facing_bed",
        "severity": 5,
        "description": "Mirror directly faces the bed.",
        "recommendation": "Move the mirror to a side wall."
      },
      {
        "rule_id": "bed_under_window",
        "severity": 4,
        "description": "Bed is placed under a window.",
        "recommendation": "Move the bed to a solid wall."
      }
    ],
    "positive_aspects": [
      "Bed is in command position",
      "Good natural lighting"
    ],
    "overall_score": 72,
    "chi_flow": {
      "quality": "good",
      "description": "Chi flows reasonably well through the room."
    },
    "element_balance": {
      "dominant": "wood",
      "missing": ["metal", "fire"],
      "suggestion": "Add metallic accessories and warm lighting."
    },
    "redesign_prompt": "A serene bedroom with the bed against the east wall..."
  }
  ''';

  group('Analysis.fromJson', () {
    late Analysis analysis;

    setUp(() {
      final json = jsonDecode(sampleJson) as Map<String, dynamic>;
      analysis = Analysis.fromJson(json);
    });

    test('parses room_type correctly', () {
      expect(analysis.roomType, 'bedroom');
    });

    test('parses elements list', () {
      expect(analysis.elements, hasLength(2));
      expect(analysis.elements[0].type, 'bed');
      expect(analysis.elements[0].label, 'Double Bed');
      expect(analysis.elements[0].position.x, 0.3);
      expect(analysis.elements[0].position.y, 0.4);
      expect(analysis.elements[0].size.w, 0.35);
      expect(analysis.elements[0].size.h, 0.25);
    });

    test('parses command_position', () {
      expect(analysis.commandPosition.primaryFurniture, 'bed');
      expect(analysis.commandPosition.isCommanding, true);
      expect(analysis.commandPosition.explanation, isNotEmpty);
    });

    test('parses violations sorted by severity desc is possible', () {
      expect(analysis.violations, hasLength(2));
      expect(analysis.violations[0].ruleId, 'mirror_facing_bed');
      expect(analysis.violations[0].severity, 5);
      expect(analysis.violations[1].severity, 4);
    });

    test('parses positive_aspects', () {
      expect(analysis.positiveAspects, hasLength(2));
      expect(analysis.positiveAspects[0], 'Bed is in command position');
    });

    test('parses overall_score', () {
      expect(analysis.overallScore, 72);
    });

    test('parses chi_flow', () {
      expect(analysis.chiFlow.quality, 'good');
      expect(analysis.chiFlow.description, isNotEmpty);
    });

    test('parses element_balance', () {
      expect(analysis.elementBalance.dominant, 'wood');
      expect(analysis.elementBalance.missing, ['metal', 'fire']);
      expect(analysis.elementBalance.suggestion, isNotEmpty);
    });

    test('parses redesign_prompt', () {
      expect(analysis.redesignPrompt, startsWith('A serene'));
    });

    test('formattedRoomType capitalizes correctly', () {
      expect(analysis.formattedRoomType, 'Bedroom');
    });
  });

  group('Analysis.fromJson with missing fields', () {
    test('handles empty JSON gracefully', () {
      final analysis = Analysis.fromJson({});
      expect(analysis.roomType, 'other');
      expect(analysis.elements, isEmpty);
      expect(analysis.violations, isEmpty);
      expect(analysis.overallScore, 50);
    });

    test('handles null nested objects', () {
      final analysis = Analysis.fromJson({
        'room_type': 'kitchen',
        'command_position': null,
        'chi_flow': null,
        'element_balance': null,
      });
      expect(analysis.roomType, 'kitchen');
      expect(analysis.commandPosition.isCommanding, false);
    });
  });

  group('toJson roundtrip', () {
    test('serializes and deserializes consistently', () {
      final json = jsonDecode(sampleJson) as Map<String, dynamic>;
      final analysis = Analysis.fromJson(json);
      final reserialized = analysis.toJson();
      final reparsed = Analysis.fromJson(reserialized);

      expect(reparsed.roomType, analysis.roomType);
      expect(reparsed.overallScore, analysis.overallScore);
      expect(reparsed.violations.length, analysis.violations.length);
      expect(reparsed.elements.length, analysis.elements.length);
    });
  });

  group('Violation', () {
    test('fromJson parses correctly', () {
      final v = Violation.fromJson({
        'rule_id': 'test_rule',
        'severity': 3,
        'description': 'Test description',
        'recommendation': 'Test fix',
      });
      expect(v.ruleId, 'test_rule');
      expect(v.severity, 3);
    });

    test('handles missing fields with defaults', () {
      final v = Violation.fromJson({});
      expect(v.ruleId, '');
      expect(v.severity, 3);
    });
  });

  group('RoomElement', () {
    test('fromJson parses position and size', () {
      final el = RoomElement.fromJson({
        'type': 'sofa',
        'label': 'L-shaped Sofa',
        'position': {'x': 0.5, 'y': 0.5},
        'size': {'w': 0.3, 'h': 0.2},
      });
      expect(el.type, 'sofa');
      expect(el.position.x, 0.5);
      expect(el.size.w, 0.3);
    });
  });
}
