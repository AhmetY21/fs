import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/command_position.dart';
import '../../domain/entities/room_element.dart';

class SpatialOverlayWidget extends StatelessWidget {
  const SpatialOverlayWidget({
    required this.imageFile,
    required this.elements,
    required this.commandPosition,
    super.key,
  });

  final File imageFile;
  final List<RoomElement> elements;
  final CommandPosition commandPosition;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Image.file(
                    imageFile,
                    width: constraints.maxWidth,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _SpatialPainter(
                        elements: elements,
                        commandPosition: commandPosition,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        _Legend(elements: elements),
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend({required this.elements});
  final List<RoomElement> elements;

  @override
  Widget build(BuildContext context) {
    final uniqueTypes = <String>{};
    final uniqueElements = <RoomElement>[];
    for (final el in elements) {
      if (uniqueTypes.add(el.type)) {
        uniqueElements.add(el);
      }
    }

    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: uniqueElements.map((el) {
        final color = _elementStrokeColor(el.type);
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              el.label,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class _SpatialPainter extends CustomPainter {
  _SpatialPainter({
    required this.elements,
    required this.commandPosition,
  });

  final List<RoomElement> elements;
  final CommandPosition commandPosition;

  @override
  void paint(Canvas canvas, Size size) {
    for (final el in elements) {
      final color = _elementStrokeColor(el.type);
      final rect = Rect.fromLTWH(
        el.position.x * size.width,
        el.position.y * size.height,
        el.size.w * size.width,
        el.size.h * size.height,
      );

      // Fill
      final fillPaint = Paint()
        ..color = color.withValues(alpha: 0.2)
        ..style = PaintingStyle.fill;
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(2)),
        fillPaint,
      );

      // Stroke (dashed effect via dashed path)
      final strokePaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(2)),
        strokePaint,
      );

      // Label background
      final labelText = '${_elementEmoji(el.type)} ${el.label}';
      final textPainter = TextPainter(
        text: TextSpan(
          text: labelText,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      final labelRect = Rect.fromLTWH(
        rect.left,
        rect.top - textPainter.height - 8 > 0
            ? rect.top - textPainter.height - 8
            : rect.top,
        textPainter.width + 10,
        textPainter.height + 6,
      );

      final bgPaint = Paint()..color = Colors.black.withValues(alpha: 0.75);
      canvas.drawRRect(
        RRect.fromRectAndRadius(labelRect, const Radius.circular(4)),
        bgPaint,
      );

      textPainter.paint(canvas, Offset(labelRect.left + 5, labelRect.top + 3));
    }

    // Command position indicator
    if (commandPosition.primaryFurniture.isNotEmpty) {
      // PERFORMANCE: Extract static lowercasing outside the loop
      final target = commandPosition.primaryFurniture.toLowerCase();

      final mainEl = elements.where((el) {
        final lowerLabel = el.label.toLowerCase();
        final lowerType = el.type.toLowerCase();
        return lowerLabel.contains(target) || lowerType.contains(target);
      }).firstOrNull;

      if (mainEl != null) {
        final cx = (mainEl.position.x + mainEl.size.w / 2) * size.width;
        final cy = (mainEl.position.y + mainEl.size.h / 2) * size.height;

        final circlePaint = Paint()
          ..color = commandPosition.isCommanding
              ? const Color(0xFF00E676)
              : const Color(0xFFFF5252)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3;
        canvas.drawCircle(Offset(cx, cy), 20, circlePaint);

        final iconPainter = TextPainter(
          text: TextSpan(
            text: commandPosition.isCommanding ? '✓' : '✗',
            style: TextStyle(
              fontSize: 16,
              color: commandPosition.isCommanding
                  ? const Color(0xFF00E676)
                  : const Color(0xFFFF5252),
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        iconPainter.paint(
          canvas,
          Offset(cx - iconPainter.width / 2, cy - iconPainter.height / 2),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SpatialPainter oldDelegate) => true;
}

// --- Helpers ---

String _elementEmoji(String type) {
  return switch (type) {
    'door' => '🚪',
    'window' => '🪟',
    'bed' => '🛏️',
    'desk' => '🪑',
    'sofa' => '🛋️',
    'chair' => '💺',
    'table' => '🪵',
    'mirror' => '🪞',
    'tv' => '📺',
    'stove' => '🔥',
    'sink' => '🚰',
    'plant' => '🌿',
    'lamp' => '💡',
    'shelf' => '📚',
    'wardrobe' => '🗄️',
    'staircase' => '🪜',
    'toilet' => '🚽',
    _ => '📦',
  };
}

Color _elementStrokeColor(String type) {
  return switch (type) {
    'door' => AppColors.elementDoor,
    'window' => AppColors.elementWindow,
    'bed' => AppColors.elementBed,
    'desk' => AppColors.elementDesk,
    'sofa' => AppColors.elementSofa,
    'chair' => AppColors.elementChair,
    'table' => AppColors.elementTable,
    'mirror' => AppColors.elementMirror,
    'tv' => AppColors.elementTv,
    'stove' => AppColors.elementStove,
    'sink' => AppColors.elementSink,
    'plant' => AppColors.elementPlant,
    'lamp' => AppColors.elementLamp,
    'shelf' => AppColors.elementShelf,
    'wardrobe' => AppColors.elementWardrobe,
    'staircase' => AppColors.elementStaircase,
    'toilet' => AppColors.elementToilet,
    _ => AppColors.elementOther,
  };
}
