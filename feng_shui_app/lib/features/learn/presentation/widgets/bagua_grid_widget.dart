import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class BaguaGridWidget extends StatelessWidget {
  const BaguaGridWidget({super.key});

  static const _cells = [
    _BaguaCell('SE', 'Wealth', 'Wood · Purple', Color(0xFF9B59B6)),
    _BaguaCell('S', 'Fame', 'Fire · Red', Color(0xFFE74C3C)),
    _BaguaCell('SW', 'Love', 'Earth · Pink', Color(0xFFE91E63)),
    _BaguaCell('E', 'Family', 'Wood · Green', Color(0xFF4CAF50)),
    _BaguaCell('Center', 'Health', 'Earth · Yellow', Color(0xFFFFC107)),
    _BaguaCell('W', 'Children', 'Metal · White', Color(0xFFBDBDBD)),
    _BaguaCell('NE', 'Knowledge', 'Earth · Blue', Color(0xFF2196F3)),
    _BaguaCell('N', 'Career', 'Water · Black', Color(0xFF455A64)),
    _BaguaCell('NW', 'Mentors', 'Metal · Gray', Color(0xFF607D8B)),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 1,
      ),
      itemCount: _cells.length,
      itemBuilder: (context, index) {
        final cell = _cells[index];
        return Container(
          decoration: BoxDecoration(
            color: cell.color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: cell.color.withValues(alpha: 0.3)),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cell.direction,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                cell.area,
                style: AppTextStyles.labelLarge.copyWith(
                  color: cell.color,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                cell.element,
                style: AppTextStyles.bodySmall.copyWith(fontSize: 9),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BaguaCell {
  const _BaguaCell(this.direction, this.area, this.element, this.color);
  final String direction;
  final String area;
  final String element;
  final Color color;
}
