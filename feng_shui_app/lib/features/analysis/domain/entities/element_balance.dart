class ElementBalance {
  const ElementBalance({
    required this.dominant,
    required this.missing,
    required this.suggestion,
  });

  final String dominant;
  final List<String> missing;
  final String suggestion;

  factory ElementBalance.fromJson(Map<String, dynamic> json) {
    return ElementBalance(
      dominant: json['dominant'] as String? ?? '',
      missing: (json['missing'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      suggestion: json['suggestion'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'dominant': dominant,
        'missing': missing,
        'suggestion': suggestion,
      };
}
