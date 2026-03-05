import 'chi_flow.dart';
import 'command_position.dart';
import 'element_balance.dart';
import 'room_element.dart';
import 'violation.dart';

class Analysis {
  const Analysis({
    required this.roomType,
    required this.elements,
    required this.commandPosition,
    required this.violations,
    required this.positiveAspects,
    required this.overallScore,
    required this.chiFlow,
    required this.elementBalance,
    required this.redesignPrompt,
  });

  final String roomType;
  final List<RoomElement> elements;
  final CommandPosition commandPosition;
  final List<Violation> violations;
  final List<String> positiveAspects;
  final int overallScore;
  final ChiFlow chiFlow;
  final ElementBalance elementBalance;
  final String redesignPrompt;

  factory Analysis.fromJson(Map<String, dynamic> json) {
    return Analysis(
      roomType: json['room_type'] as String? ?? 'other',
      elements: (json['elements'] as List<dynamic>?)
              ?.map((e) => RoomElement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      commandPosition: CommandPosition.fromJson(
        json['command_position'] as Map<String, dynamic>? ?? {},
      ),
      violations: (json['violations'] as List<dynamic>?)
              ?.map((e) => Violation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      positiveAspects: (json['positive_aspects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      overallScore: (json['overall_score'] as num?)?.toInt() ?? 50,
      chiFlow: ChiFlow.fromJson(
        json['chi_flow'] as Map<String, dynamic>? ?? {},
      ),
      elementBalance: ElementBalance.fromJson(
        json['element_balance'] as Map<String, dynamic>? ?? {},
      ),
      redesignPrompt: json['redesign_prompt'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'room_type': roomType,
        'elements': elements.map((e) => e.toJson()).toList(),
        'command_position': commandPosition.toJson(),
        'violations': violations.map((v) => v.toJson()).toList(),
        'positive_aspects': positiveAspects,
        'overall_score': overallScore,
        'chi_flow': chiFlow.toJson(),
        'element_balance': elementBalance.toJson(),
        'redesign_prompt': redesignPrompt,
      };

  String get formattedRoomType =>
      roomType.replaceAll('_', ' ').split(' ').map((w) {
        if (w.isEmpty) return w;
        return '${w[0].toUpperCase()}${w.substring(1)}';
      }).join(' ');
}
