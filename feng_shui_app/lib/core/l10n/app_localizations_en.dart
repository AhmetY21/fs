// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Feng Shui';

  @override
  String get appSubtitle => 'AI Room Analyzer';

  @override
  String get navAnalyze => 'Analyze';

  @override
  String get navLearn => 'Learn';

  @override
  String get navSettings => 'Settings';

  @override
  String get stepUpload => 'Upload';

  @override
  String get stepAnalyze => 'Analyze';

  @override
  String get stepReport => 'Report';

  @override
  String get uploadTitle => 'Upload Your Room Photo';

  @override
  String get uploadSubtitle =>
      'Take a clear photo of your room showing the door position, main furniture, and windows.';

  @override
  String get uploadPlaceholder => 'Tap to take a photo or choose from gallery';

  @override
  String get uploadFormats => 'JPEG, PNG, WebP — Max 10 MB';

  @override
  String get uploadCamera => 'Camera';

  @override
  String get uploadGallery => 'Gallery';

  @override
  String get uploadRemove => 'Remove';

  @override
  String get analyzeButton => 'Analyze Feng Shui';

  @override
  String get analyzingMessage => 'Analyzing with Feng Shui AI...';

  @override
  String get newAnalysis => 'New Analysis';

  @override
  String get spatialMapTitle => 'Spatial Map';

  @override
  String get reportTitle => 'Feng Shui Report';

  @override
  String get redesignPromptTitle => 'AI Redesign Prompt';

  @override
  String get copyPrompt => 'Copy Prompt';

  @override
  String get promptCopied => 'Prompt copied to clipboard';

  @override
  String get redesignNote =>
      'Use this prompt with AI image generators for room redesign';

  @override
  String get roomType => 'Room Type';

  @override
  String get chiFlow => 'Chi Flow';

  @override
  String get dominantElement => 'Dominant Element';

  @override
  String get commandPosition => 'Command Position';

  @override
  String commandPositionPrimary(String furniture) {
    return 'Primary: $furniture';
  }

  @override
  String issuesFound(int count) {
    return 'Issues Found ($count)';
  }

  @override
  String get whatsWorkingWell => 'What\'s Working Well';

  @override
  String get fiveElementBalance => 'Five Element Balance';

  @override
  String get dominant => 'Dominant';

  @override
  String get missing => 'Missing';

  @override
  String get suggestion => 'Suggestion';

  @override
  String get chiFlowAnalysis => 'Chi Flow Analysis';

  @override
  String get severityCritical => 'Critical';

  @override
  String get severityHigh => 'High';

  @override
  String get severityModerate => 'Moderate';

  @override
  String get severityLow => 'Low';

  @override
  String get severityMinor => 'Minor';

  @override
  String severityLabel(String label, int value) {
    return 'Severity: $label ($value/5)';
  }

  @override
  String get gradeExcellent => 'Excellent';

  @override
  String get gradeVeryGood => 'Very Good';

  @override
  String get gradeGood => 'Good';

  @override
  String get gradeFair => 'Fair';

  @override
  String get gradeNeedsWork => 'Needs Work';

  @override
  String get gradePoor => 'Poor';

  @override
  String get gradeMajorIssues => 'Major Issues';

  @override
  String get chiExcellent => 'Excellent';

  @override
  String get chiGood => 'Good';

  @override
  String get chiModerate => 'Moderate';

  @override
  String get chiPoor => 'Poor';

  @override
  String get chiStagnant => 'Stagnant';

  @override
  String get learnTitle => 'Feng Shui 101';

  @override
  String get learnSubtitle =>
      'The ancient art of creating harmony between you and your environment. Learn the core concepts that power our AI analysis.';

  @override
  String get learnChiTitle => 'Chi — Life Force Energy';

  @override
  String get learnChiBadge => 'Foundation';

  @override
  String get learnChiBody =>
      'Chi is the invisible life-force energy that flows through everything — your body, your home, and the natural world. In Feng Shui, the goal is to allow chi to flow gently and freely through your living spaces, like a meandering stream.';

  @override
  String get learnChiGoodTitle => 'Good Chi Flow';

  @override
  String get learnChiGood1 => 'Meanders gently through rooms';

  @override
  String get learnChiGood2 => 'Enters through the front door';

  @override
  String get learnChiGood3 => 'Flows around curved furniture';

  @override
  String get learnChiGood4 => 'Pauses in comfortable seating areas';

  @override
  String get learnChiGood5 => 'Exits gently through windows';

  @override
  String get learnChiBlockedTitle => 'Blocked Chi';

  @override
  String get learnChiBlocked1 => 'Clutter stops energy in corners';

  @override
  String get learnChiBlocked2 => 'Closed doors trap stagnant energy';

  @override
  String get learnChiBlocked3 => 'Dark, unused rooms accumulate negativity';

  @override
  String get learnChiBlocked4 => 'Overfull closets create pressure';

  @override
  String get learnChiBlocked5 => 'Items under the bed disturb sleep';

  @override
  String get learnChiShaTitle => 'Sha Chi (Killing Energy)';

  @override
  String get learnChiSha1 => 'Long straight hallways accelerate energy';

  @override
  String get learnChiSha2 => 'Sharp corners point poison arrows';

  @override
  String get learnChiSha3 =>
      'Door directly facing a window — chi rushes through';

  @override
  String get learnChiSha4 => 'Exposed beams press down on people';

  @override
  String get learnChiSha5 => 'Too-fast chi causes anxiety';

  @override
  String get learnCommandTitle => 'The Command Position';

  @override
  String get learnCommandBadge => 'Most Important Rule';

  @override
  String get learnCommandBody =>
      'The Command Position determines where the main piece of furniture in each room should be placed — the bed in a bedroom, the desk in an office, and the stove in a kitchen.';

  @override
  String get learnCommandRule1 =>
      'See the door — You must have a clear sightline to the entrance.';

  @override
  String get learnCommandRule2 =>
      'Not in direct line — Don\'t place furniture directly opposite the door.';

  @override
  String get learnCommandRule3 =>
      'Solid wall behind — Your back should be supported by a wall, not a window.';

  @override
  String get learnElementsTitle => 'The Five Elements';

  @override
  String get learnElementsBadge => 'Balance';

  @override
  String get learnElementsBody =>
      'Everything in the universe corresponds to one of five elements. A balanced room contains all five. They follow a productive cycle and a destructive cycle.';

  @override
  String get learnElementsCycle => 'Wood → Fire → Earth → Metal → Water → Wood';

  @override
  String get elementWood => 'Wood';

  @override
  String get elementFire => 'Fire';

  @override
  String get elementEarth => 'Earth';

  @override
  String get elementMetal => 'Metal';

  @override
  String get elementWater => 'Water';

  @override
  String get elementColors => 'Colors';

  @override
  String get elementShapes => 'Shapes';

  @override
  String get elementDirection => 'Direction';

  @override
  String get elementRepresents => 'Represents';

  @override
  String get elementMaterials => 'Materials';

  @override
  String get woodColors => 'Green, Brown';

  @override
  String get woodShapes => 'Rectangular, Columnar';

  @override
  String get woodDirection => 'East, Southeast';

  @override
  String get woodRepresents => 'Growth, Vitality';

  @override
  String get woodMaterials => 'Plants, Wooden furniture';

  @override
  String get fireColors => 'Red, Orange, Pink';

  @override
  String get fireShapes => 'Triangular, Pointed';

  @override
  String get fireDirection => 'South';

  @override
  String get fireRepresents => 'Passion, Fame';

  @override
  String get fireMaterials => 'Candles, Lights';

  @override
  String get earthColors => 'Yellow, Beige, Terracotta';

  @override
  String get earthShapes => 'Square, Flat';

  @override
  String get earthDirection => 'Center, SW, NE';

  @override
  String get earthRepresents => 'Stability, Nourishment';

  @override
  String get earthMaterials => 'Ceramics, Stone';

  @override
  String get metalColors => 'White, Gold, Silver';

  @override
  String get metalShapes => 'Round, Spherical';

  @override
  String get metalDirection => 'West, Northwest';

  @override
  String get metalRepresents => 'Precision, Clarity';

  @override
  String get metalMaterials => 'Metal, Iron, Brass';

  @override
  String get waterColors => 'Blue, Black';

  @override
  String get waterShapes => 'Wavy, Irregular';

  @override
  String get waterDirection => 'North';

  @override
  String get waterRepresents => 'Wisdom, Career';

  @override
  String get waterMaterials => 'Glass, Mirrors, Fountains';

  @override
  String get learnBaguaTitle => 'The Bagua Map';

  @override
  String get learnBaguaBadge => 'Map';

  @override
  String get learnBaguaBody =>
      'The Bagua is an energy map overlaid on your floor plan. It divides your space into 9 life areas, each linked to a specific direction and element.';

  @override
  String get learnShaChiTitle => 'Sha Chi — Poison Arrows';

  @override
  String get learnShaChiBadge => 'Avoid';

  @override
  String get learnShaChiBody =>
      'Sha Chi is aggressive, fast-moving energy caused by sharp angles, long straight lines, and oppressive structures.';

  @override
  String get shaPoisonArrows => 'Poison Arrows';

  @override
  String get shaPoisonArrowsDesc =>
      'Sharp corners of furniture pointing at where you sit or sleep. Fix: angle furniture away or use plants.';

  @override
  String get shaCorridors => 'Long Corridors';

  @override
  String get shaCorridorsDesc =>
      'Narrow hallways act like tunnels, accelerating chi. Fix: add artwork, rugs, or plants along the walls.';

  @override
  String get shaBeams => 'Exposed Beams';

  @override
  String get shaBeamsDesc =>
      'Heavy beams above your bed or desk press down with oppressive energy. Fix: drape fabric or paint them.';

  @override
  String get shaMirror => 'Mirror Facing Bed';

  @override
  String get shaMirrorDesc =>
      'Mirrors bounce energy and can startle you at night. Fix: relocate or cover mirrors at night.';

  @override
  String get learnRoomTipsTitle => 'Room-by-Room Guide';

  @override
  String get learnRoomTipsBadge => 'Practical';

  @override
  String get roomBedroom => 'Bedroom';

  @override
  String get roomOffice => 'Office';

  @override
  String get roomLiving => 'Living Room';

  @override
  String get roomKitchen => 'Kitchen';

  @override
  String get roomEntrance => 'Entrance';

  @override
  String get roomBathroom => 'Bathroom';

  @override
  String get readyToAnalyze => 'Ready to analyze your space?';

  @override
  String get readyToAnalyzeSubtitle =>
      'Upload a photo and get an AI-powered Feng Shui assessment.';

  @override
  String get startAnalysis => 'Start Analysis';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsAbout => 'About';

  @override
  String settingsVersion(String version) {
    return 'Version $version';
  }

  @override
  String settingsRulesCount(int count) {
    return 'Feng Shui knowledge base with $count+ verified rules';
  }

  @override
  String get settingsPoweredBy => 'Powered by Gemini Vision AI';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get errorNetwork =>
      'No internet connection. Please check your network.';

  @override
  String get errorRateLimit => 'Too many requests. Please wait a moment.';

  @override
  String get errorInvalidImage =>
      'Invalid image. Please use JPEG, PNG, or WebP.';

  @override
  String get errorImageTooLarge => 'Image is too large. Maximum size is 10 MB.';

  @override
  String get errorAnalysisFailed => 'Analysis failed. Please try again.';

  @override
  String get retry => 'Retry';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageTurkish => 'Turkish';
}
