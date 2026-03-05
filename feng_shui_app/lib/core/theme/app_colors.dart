import 'dart:ui';

abstract final class AppColors {
  // Backgrounds
  static const bgPrimary = Color(0xFF0A0A0F);
  static const bgSecondary = Color(0xFF12121A);
  static const bgCard = Color(0xFF16161F);
  static const bgGlass = Color(0x0AFFFFFF);
  static const bgGlassHover = Color(0x14FFFFFF);

  // Text
  static const textPrimary = Color(0xFFF0F0F5);
  static const textSecondary = Color(0xFF9A9AAF);
  static const textMuted = Color(0xFF5A5A6F);

  // Accents
  static const accentGold = Color(0xFFD4A745);
  static const accentJade = Color(0xFF4ECDC4);
  static const accentRed = Color(0xFFE74C3C);
  static const accentPurple = Color(0xFF9B59B6);
  static const accentBlue = Color(0xFF3498DB);

  // Borders
  static const borderSubtle = Color(0x0FFFFFFF);
  static const borderAccent = Color(0x33D4A745);

  // Score grades
  static const gradeAPlus = Color(0xFF00E676);
  static const gradeA = Color(0xFF66BB6A);
  static const gradeB = Color(0xFF9CCC65);
  static const gradeCPlus = Color(0xFFFFEE58);
  static const gradeC = Color(0xFFFFA726);
  static const gradeD = Color(0xFFFF7043);
  static const gradeF = Color(0xFFEF5350);

  // Severity
  static const severityCritical = Color(0xFFEF5350);
  static const severityHigh = Color(0xFFFF7043);
  static const severityModerate = Color(0xFFFFA726);
  static const severityLow = Color(0xFFFFEE58);
  static const severityMinor = Color(0xFF66BB6A);

  // Element colors (for spatial overlay)
  static const elementDoor = Color(0xFF4CAF50);
  static const elementWindow = Color(0xFF2196F3);
  static const elementBed = Color(0xFF9C27B0);
  static const elementDesk = Color(0xFFFF9800);
  static const elementSofa = Color(0xFF00BCD4);
  static const elementChair = Color(0xFF795548);
  static const elementTable = Color(0xFFFFC107);
  static const elementMirror = Color(0xFFE0E0E0);
  static const elementTv = Color(0xFF3F51B5);
  static const elementStove = Color(0xFFF44336);
  static const elementSink = Color(0xFF03A9F4);
  static const elementPlant = Color(0xFF8BC34A);
  static const elementLamp = Color(0xFFFFEB3B);
  static const elementShelf = Color(0xFF9E9E9E);
  static const elementWardrobe = Color(0xFF4E342E);
  static const elementStaircase = Color(0xFF607D8B);
  static const elementToilet = Color(0xFFB0BEC5);
  static const elementOther = Color(0xFFBDBDBD);
}
