import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(16);
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: padding ?? const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.bgGlass,
              borderRadius: radius,
              border: Border.all(color: AppColors.borderSubtle),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
