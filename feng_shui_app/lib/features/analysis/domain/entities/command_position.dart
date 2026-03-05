class CommandPosition {
  const CommandPosition({
    required this.primaryFurniture,
    required this.isCommanding,
    required this.explanation,
  });

  final String primaryFurniture;
  final bool isCommanding;
  final String explanation;

  factory CommandPosition.fromJson(Map<String, dynamic> json) {
    return CommandPosition(
      primaryFurniture: json['primary_furniture'] as String? ?? '',
      isCommanding: json['is_commanding'] as bool? ?? false,
      explanation: json['explanation'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'primary_furniture': primaryFurniture,
        'is_commanding': isCommanding,
        'explanation': explanation,
      };
}
