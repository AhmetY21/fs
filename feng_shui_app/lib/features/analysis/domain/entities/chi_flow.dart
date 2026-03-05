class ChiFlow {
  const ChiFlow({
    required this.quality,
    required this.description,
  });

  final String quality;
  final String description;

  factory ChiFlow.fromJson(Map<String, dynamic> json) {
    return ChiFlow(
      quality: json['quality'] as String? ?? 'moderate',
      description: json['description'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'quality': quality,
        'description': description,
      };
}
