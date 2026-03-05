class Violation {
  const Violation({
    required this.ruleId,
    required this.severity,
    required this.description,
    required this.recommendation,
  });

  final String ruleId;
  final int severity;
  final String description;
  final String recommendation;

  factory Violation.fromJson(Map<String, dynamic> json) {
    return Violation(
      ruleId: json['rule_id'] as String? ?? '',
      severity: (json['severity'] as num?)?.toInt() ?? 3,
      description: json['description'] as String? ?? '',
      recommendation: json['recommendation'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'rule_id': ruleId,
        'severity': severity,
        'description': description,
        'recommendation': recommendation,
      };
}
