class ElementPosition {
  const ElementPosition({required this.x, required this.y});
  final double x;
  final double y;

  factory ElementPosition.fromJson(Map<String, dynamic> json) {
    return ElementPosition(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {'x': x, 'y': y};
}

class ElementSize {
  const ElementSize({required this.w, required this.h});
  final double w;
  final double h;

  factory ElementSize.fromJson(Map<String, dynamic> json) {
    return ElementSize(
      w: (json['w'] as num).toDouble(),
      h: (json['h'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {'w': w, 'h': h};
}

class RoomElement {
  const RoomElement({
    required this.type,
    required this.label,
    required this.position,
    required this.size,
  });

  final String type;
  final String label;
  final ElementPosition position;
  final ElementSize size;

  factory RoomElement.fromJson(Map<String, dynamic> json) {
    return RoomElement(
      type: json['type'] as String? ?? 'other',
      label: json['label'] as String? ?? json['type'] as String? ?? 'Unknown',
      position: ElementPosition.fromJson(json['position'] as Map<String, dynamic>),
      size: ElementSize.fromJson(json['size'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'label': label,
        'position': position.toJson(),
        'size': size.toJson(),
      };
}
