import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Feng Shui'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'AI Room Analyzer'**
  String get appSubtitle;

  /// No description provided for @navAnalyze.
  ///
  /// In en, this message translates to:
  /// **'Analyze'**
  String get navAnalyze;

  /// No description provided for @navLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get navLearn;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @stepUpload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get stepUpload;

  /// No description provided for @stepAnalyze.
  ///
  /// In en, this message translates to:
  /// **'Analyze'**
  String get stepAnalyze;

  /// No description provided for @stepReport.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get stepReport;

  /// No description provided for @uploadTitle.
  ///
  /// In en, this message translates to:
  /// **'Upload Your Room Photo'**
  String get uploadTitle;

  /// No description provided for @uploadSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Take a clear photo of your room showing the door position, main furniture, and windows.'**
  String get uploadSubtitle;

  /// No description provided for @uploadPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Tap to take a photo or choose from gallery'**
  String get uploadPlaceholder;

  /// No description provided for @uploadFormats.
  ///
  /// In en, this message translates to:
  /// **'JPEG, PNG, WebP — Max 10 MB'**
  String get uploadFormats;

  /// No description provided for @uploadCamera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get uploadCamera;

  /// No description provided for @uploadGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get uploadGallery;

  /// No description provided for @uploadRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get uploadRemove;

  /// No description provided for @analyzeButton.
  ///
  /// In en, this message translates to:
  /// **'Analyze Feng Shui'**
  String get analyzeButton;

  /// No description provided for @analyzingMessage.
  ///
  /// In en, this message translates to:
  /// **'Analyzing with Feng Shui AI...'**
  String get analyzingMessage;

  /// No description provided for @newAnalysis.
  ///
  /// In en, this message translates to:
  /// **'New Analysis'**
  String get newAnalysis;

  /// No description provided for @spatialMapTitle.
  ///
  /// In en, this message translates to:
  /// **'Spatial Map'**
  String get spatialMapTitle;

  /// No description provided for @reportTitle.
  ///
  /// In en, this message translates to:
  /// **'Feng Shui Report'**
  String get reportTitle;

  /// No description provided for @redesignPromptTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Redesign Prompt'**
  String get redesignPromptTitle;

  /// No description provided for @copyPrompt.
  ///
  /// In en, this message translates to:
  /// **'Copy Prompt'**
  String get copyPrompt;

  /// No description provided for @promptCopied.
  ///
  /// In en, this message translates to:
  /// **'Prompt copied to clipboard'**
  String get promptCopied;

  /// No description provided for @redesignNote.
  ///
  /// In en, this message translates to:
  /// **'Use this prompt with AI image generators for room redesign'**
  String get redesignNote;

  /// No description provided for @roomType.
  ///
  /// In en, this message translates to:
  /// **'Room Type'**
  String get roomType;

  /// No description provided for @chiFlow.
  ///
  /// In en, this message translates to:
  /// **'Chi Flow'**
  String get chiFlow;

  /// No description provided for @dominantElement.
  ///
  /// In en, this message translates to:
  /// **'Dominant Element'**
  String get dominantElement;

  /// No description provided for @commandPosition.
  ///
  /// In en, this message translates to:
  /// **'Command Position'**
  String get commandPosition;

  /// No description provided for @commandPositionPrimary.
  ///
  /// In en, this message translates to:
  /// **'Primary: {furniture}'**
  String commandPositionPrimary(String furniture);

  /// No description provided for @issuesFound.
  ///
  /// In en, this message translates to:
  /// **'Issues Found ({count})'**
  String issuesFound(int count);

  /// No description provided for @whatsWorkingWell.
  ///
  /// In en, this message translates to:
  /// **'What\'s Working Well'**
  String get whatsWorkingWell;

  /// No description provided for @fiveElementBalance.
  ///
  /// In en, this message translates to:
  /// **'Five Element Balance'**
  String get fiveElementBalance;

  /// No description provided for @dominant.
  ///
  /// In en, this message translates to:
  /// **'Dominant'**
  String get dominant;

  /// No description provided for @missing.
  ///
  /// In en, this message translates to:
  /// **'Missing'**
  String get missing;

  /// No description provided for @suggestion.
  ///
  /// In en, this message translates to:
  /// **'Suggestion'**
  String get suggestion;

  /// No description provided for @chiFlowAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Chi Flow Analysis'**
  String get chiFlowAnalysis;

  /// No description provided for @severityCritical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get severityCritical;

  /// No description provided for @severityHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get severityHigh;

  /// No description provided for @severityModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get severityModerate;

  /// No description provided for @severityLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get severityLow;

  /// No description provided for @severityMinor.
  ///
  /// In en, this message translates to:
  /// **'Minor'**
  String get severityMinor;

  /// No description provided for @severityLabel.
  ///
  /// In en, this message translates to:
  /// **'Severity: {label} ({value}/5)'**
  String severityLabel(String label, int value);

  /// No description provided for @gradeExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get gradeExcellent;

  /// No description provided for @gradeVeryGood.
  ///
  /// In en, this message translates to:
  /// **'Very Good'**
  String get gradeVeryGood;

  /// No description provided for @gradeGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get gradeGood;

  /// No description provided for @gradeFair.
  ///
  /// In en, this message translates to:
  /// **'Fair'**
  String get gradeFair;

  /// No description provided for @gradeNeedsWork.
  ///
  /// In en, this message translates to:
  /// **'Needs Work'**
  String get gradeNeedsWork;

  /// No description provided for @gradePoor.
  ///
  /// In en, this message translates to:
  /// **'Poor'**
  String get gradePoor;

  /// No description provided for @gradeMajorIssues.
  ///
  /// In en, this message translates to:
  /// **'Major Issues'**
  String get gradeMajorIssues;

  /// No description provided for @chiExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get chiExcellent;

  /// No description provided for @chiGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get chiGood;

  /// No description provided for @chiModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get chiModerate;

  /// No description provided for @chiPoor.
  ///
  /// In en, this message translates to:
  /// **'Poor'**
  String get chiPoor;

  /// No description provided for @chiStagnant.
  ///
  /// In en, this message translates to:
  /// **'Stagnant'**
  String get chiStagnant;

  /// No description provided for @learnTitle.
  ///
  /// In en, this message translates to:
  /// **'Feng Shui 101'**
  String get learnTitle;

  /// No description provided for @learnSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The ancient art of creating harmony between you and your environment. Learn the core concepts that power our AI analysis.'**
  String get learnSubtitle;

  /// No description provided for @learnChiTitle.
  ///
  /// In en, this message translates to:
  /// **'Chi — Life Force Energy'**
  String get learnChiTitle;

  /// No description provided for @learnChiBadge.
  ///
  /// In en, this message translates to:
  /// **'Foundation'**
  String get learnChiBadge;

  /// No description provided for @learnChiBody.
  ///
  /// In en, this message translates to:
  /// **'Chi is the invisible life-force energy that flows through everything — your body, your home, and the natural world. In Feng Shui, the goal is to allow chi to flow gently and freely through your living spaces, like a meandering stream.'**
  String get learnChiBody;

  /// No description provided for @learnChiGoodTitle.
  ///
  /// In en, this message translates to:
  /// **'Good Chi Flow'**
  String get learnChiGoodTitle;

  /// No description provided for @learnChiGood1.
  ///
  /// In en, this message translates to:
  /// **'Meanders gently through rooms'**
  String get learnChiGood1;

  /// No description provided for @learnChiGood2.
  ///
  /// In en, this message translates to:
  /// **'Enters through the front door'**
  String get learnChiGood2;

  /// No description provided for @learnChiGood3.
  ///
  /// In en, this message translates to:
  /// **'Flows around curved furniture'**
  String get learnChiGood3;

  /// No description provided for @learnChiGood4.
  ///
  /// In en, this message translates to:
  /// **'Pauses in comfortable seating areas'**
  String get learnChiGood4;

  /// No description provided for @learnChiGood5.
  ///
  /// In en, this message translates to:
  /// **'Exits gently through windows'**
  String get learnChiGood5;

  /// No description provided for @learnChiBlockedTitle.
  ///
  /// In en, this message translates to:
  /// **'Blocked Chi'**
  String get learnChiBlockedTitle;

  /// No description provided for @learnChiBlocked1.
  ///
  /// In en, this message translates to:
  /// **'Clutter stops energy in corners'**
  String get learnChiBlocked1;

  /// No description provided for @learnChiBlocked2.
  ///
  /// In en, this message translates to:
  /// **'Closed doors trap stagnant energy'**
  String get learnChiBlocked2;

  /// No description provided for @learnChiBlocked3.
  ///
  /// In en, this message translates to:
  /// **'Dark, unused rooms accumulate negativity'**
  String get learnChiBlocked3;

  /// No description provided for @learnChiBlocked4.
  ///
  /// In en, this message translates to:
  /// **'Overfull closets create pressure'**
  String get learnChiBlocked4;

  /// No description provided for @learnChiBlocked5.
  ///
  /// In en, this message translates to:
  /// **'Items under the bed disturb sleep'**
  String get learnChiBlocked5;

  /// No description provided for @learnChiShaTitle.
  ///
  /// In en, this message translates to:
  /// **'Sha Chi (Killing Energy)'**
  String get learnChiShaTitle;

  /// No description provided for @learnChiSha1.
  ///
  /// In en, this message translates to:
  /// **'Long straight hallways accelerate energy'**
  String get learnChiSha1;

  /// No description provided for @learnChiSha2.
  ///
  /// In en, this message translates to:
  /// **'Sharp corners point poison arrows'**
  String get learnChiSha2;

  /// No description provided for @learnChiSha3.
  ///
  /// In en, this message translates to:
  /// **'Door directly facing a window — chi rushes through'**
  String get learnChiSha3;

  /// No description provided for @learnChiSha4.
  ///
  /// In en, this message translates to:
  /// **'Exposed beams press down on people'**
  String get learnChiSha4;

  /// No description provided for @learnChiSha5.
  ///
  /// In en, this message translates to:
  /// **'Too-fast chi causes anxiety'**
  String get learnChiSha5;

  /// No description provided for @learnCommandTitle.
  ///
  /// In en, this message translates to:
  /// **'The Command Position'**
  String get learnCommandTitle;

  /// No description provided for @learnCommandBadge.
  ///
  /// In en, this message translates to:
  /// **'Most Important Rule'**
  String get learnCommandBadge;

  /// No description provided for @learnCommandBody.
  ///
  /// In en, this message translates to:
  /// **'The Command Position determines where the main piece of furniture in each room should be placed — the bed in a bedroom, the desk in an office, and the stove in a kitchen.'**
  String get learnCommandBody;

  /// No description provided for @learnCommandRule1.
  ///
  /// In en, this message translates to:
  /// **'See the door — You must have a clear sightline to the entrance.'**
  String get learnCommandRule1;

  /// No description provided for @learnCommandRule2.
  ///
  /// In en, this message translates to:
  /// **'Not in direct line — Don\'t place furniture directly opposite the door.'**
  String get learnCommandRule2;

  /// No description provided for @learnCommandRule3.
  ///
  /// In en, this message translates to:
  /// **'Solid wall behind — Your back should be supported by a wall, not a window.'**
  String get learnCommandRule3;

  /// No description provided for @learnElementsTitle.
  ///
  /// In en, this message translates to:
  /// **'The Five Elements'**
  String get learnElementsTitle;

  /// No description provided for @learnElementsBadge.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get learnElementsBadge;

  /// No description provided for @learnElementsBody.
  ///
  /// In en, this message translates to:
  /// **'Everything in the universe corresponds to one of five elements. A balanced room contains all five. They follow a productive cycle and a destructive cycle.'**
  String get learnElementsBody;

  /// No description provided for @learnElementsCycle.
  ///
  /// In en, this message translates to:
  /// **'Wood → Fire → Earth → Metal → Water → Wood'**
  String get learnElementsCycle;

  /// No description provided for @elementWood.
  ///
  /// In en, this message translates to:
  /// **'Wood'**
  String get elementWood;

  /// No description provided for @elementFire.
  ///
  /// In en, this message translates to:
  /// **'Fire'**
  String get elementFire;

  /// No description provided for @elementEarth.
  ///
  /// In en, this message translates to:
  /// **'Earth'**
  String get elementEarth;

  /// No description provided for @elementMetal.
  ///
  /// In en, this message translates to:
  /// **'Metal'**
  String get elementMetal;

  /// No description provided for @elementWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get elementWater;

  /// No description provided for @elementColors.
  ///
  /// In en, this message translates to:
  /// **'Colors'**
  String get elementColors;

  /// No description provided for @elementShapes.
  ///
  /// In en, this message translates to:
  /// **'Shapes'**
  String get elementShapes;

  /// No description provided for @elementDirection.
  ///
  /// In en, this message translates to:
  /// **'Direction'**
  String get elementDirection;

  /// No description provided for @elementRepresents.
  ///
  /// In en, this message translates to:
  /// **'Represents'**
  String get elementRepresents;

  /// No description provided for @elementMaterials.
  ///
  /// In en, this message translates to:
  /// **'Materials'**
  String get elementMaterials;

  /// No description provided for @woodColors.
  ///
  /// In en, this message translates to:
  /// **'Green, Brown'**
  String get woodColors;

  /// No description provided for @woodShapes.
  ///
  /// In en, this message translates to:
  /// **'Rectangular, Columnar'**
  String get woodShapes;

  /// No description provided for @woodDirection.
  ///
  /// In en, this message translates to:
  /// **'East, Southeast'**
  String get woodDirection;

  /// No description provided for @woodRepresents.
  ///
  /// In en, this message translates to:
  /// **'Growth, Vitality'**
  String get woodRepresents;

  /// No description provided for @woodMaterials.
  ///
  /// In en, this message translates to:
  /// **'Plants, Wooden furniture'**
  String get woodMaterials;

  /// No description provided for @fireColors.
  ///
  /// In en, this message translates to:
  /// **'Red, Orange, Pink'**
  String get fireColors;

  /// No description provided for @fireShapes.
  ///
  /// In en, this message translates to:
  /// **'Triangular, Pointed'**
  String get fireShapes;

  /// No description provided for @fireDirection.
  ///
  /// In en, this message translates to:
  /// **'South'**
  String get fireDirection;

  /// No description provided for @fireRepresents.
  ///
  /// In en, this message translates to:
  /// **'Passion, Fame'**
  String get fireRepresents;

  /// No description provided for @fireMaterials.
  ///
  /// In en, this message translates to:
  /// **'Candles, Lights'**
  String get fireMaterials;

  /// No description provided for @earthColors.
  ///
  /// In en, this message translates to:
  /// **'Yellow, Beige, Terracotta'**
  String get earthColors;

  /// No description provided for @earthShapes.
  ///
  /// In en, this message translates to:
  /// **'Square, Flat'**
  String get earthShapes;

  /// No description provided for @earthDirection.
  ///
  /// In en, this message translates to:
  /// **'Center, SW, NE'**
  String get earthDirection;

  /// No description provided for @earthRepresents.
  ///
  /// In en, this message translates to:
  /// **'Stability, Nourishment'**
  String get earthRepresents;

  /// No description provided for @earthMaterials.
  ///
  /// In en, this message translates to:
  /// **'Ceramics, Stone'**
  String get earthMaterials;

  /// No description provided for @metalColors.
  ///
  /// In en, this message translates to:
  /// **'White, Gold, Silver'**
  String get metalColors;

  /// No description provided for @metalShapes.
  ///
  /// In en, this message translates to:
  /// **'Round, Spherical'**
  String get metalShapes;

  /// No description provided for @metalDirection.
  ///
  /// In en, this message translates to:
  /// **'West, Northwest'**
  String get metalDirection;

  /// No description provided for @metalRepresents.
  ///
  /// In en, this message translates to:
  /// **'Precision, Clarity'**
  String get metalRepresents;

  /// No description provided for @metalMaterials.
  ///
  /// In en, this message translates to:
  /// **'Metal, Iron, Brass'**
  String get metalMaterials;

  /// No description provided for @waterColors.
  ///
  /// In en, this message translates to:
  /// **'Blue, Black'**
  String get waterColors;

  /// No description provided for @waterShapes.
  ///
  /// In en, this message translates to:
  /// **'Wavy, Irregular'**
  String get waterShapes;

  /// No description provided for @waterDirection.
  ///
  /// In en, this message translates to:
  /// **'North'**
  String get waterDirection;

  /// No description provided for @waterRepresents.
  ///
  /// In en, this message translates to:
  /// **'Wisdom, Career'**
  String get waterRepresents;

  /// No description provided for @waterMaterials.
  ///
  /// In en, this message translates to:
  /// **'Glass, Mirrors, Fountains'**
  String get waterMaterials;

  /// No description provided for @learnBaguaTitle.
  ///
  /// In en, this message translates to:
  /// **'The Bagua Map'**
  String get learnBaguaTitle;

  /// No description provided for @learnBaguaBadge.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get learnBaguaBadge;

  /// No description provided for @learnBaguaBody.
  ///
  /// In en, this message translates to:
  /// **'The Bagua is an energy map overlaid on your floor plan. It divides your space into 9 life areas, each linked to a specific direction and element.'**
  String get learnBaguaBody;

  /// No description provided for @learnShaChiTitle.
  ///
  /// In en, this message translates to:
  /// **'Sha Chi — Poison Arrows'**
  String get learnShaChiTitle;

  /// No description provided for @learnShaChiBadge.
  ///
  /// In en, this message translates to:
  /// **'Avoid'**
  String get learnShaChiBadge;

  /// No description provided for @learnShaChiBody.
  ///
  /// In en, this message translates to:
  /// **'Sha Chi is aggressive, fast-moving energy caused by sharp angles, long straight lines, and oppressive structures.'**
  String get learnShaChiBody;

  /// No description provided for @shaPoisonArrows.
  ///
  /// In en, this message translates to:
  /// **'Poison Arrows'**
  String get shaPoisonArrows;

  /// No description provided for @shaPoisonArrowsDesc.
  ///
  /// In en, this message translates to:
  /// **'Sharp corners of furniture pointing at where you sit or sleep. Fix: angle furniture away or use plants.'**
  String get shaPoisonArrowsDesc;

  /// No description provided for @shaCorridors.
  ///
  /// In en, this message translates to:
  /// **'Long Corridors'**
  String get shaCorridors;

  /// No description provided for @shaCorridorsDesc.
  ///
  /// In en, this message translates to:
  /// **'Narrow hallways act like tunnels, accelerating chi. Fix: add artwork, rugs, or plants along the walls.'**
  String get shaCorridorsDesc;

  /// No description provided for @shaBeams.
  ///
  /// In en, this message translates to:
  /// **'Exposed Beams'**
  String get shaBeams;

  /// No description provided for @shaBeamsDesc.
  ///
  /// In en, this message translates to:
  /// **'Heavy beams above your bed or desk press down with oppressive energy. Fix: drape fabric or paint them.'**
  String get shaBeamsDesc;

  /// No description provided for @shaMirror.
  ///
  /// In en, this message translates to:
  /// **'Mirror Facing Bed'**
  String get shaMirror;

  /// No description provided for @shaMirrorDesc.
  ///
  /// In en, this message translates to:
  /// **'Mirrors bounce energy and can startle you at night. Fix: relocate or cover mirrors at night.'**
  String get shaMirrorDesc;

  /// No description provided for @learnRoomTipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Room-by-Room Guide'**
  String get learnRoomTipsTitle;

  /// No description provided for @learnRoomTipsBadge.
  ///
  /// In en, this message translates to:
  /// **'Practical'**
  String get learnRoomTipsBadge;

  /// No description provided for @roomBedroom.
  ///
  /// In en, this message translates to:
  /// **'Bedroom'**
  String get roomBedroom;

  /// No description provided for @roomOffice.
  ///
  /// In en, this message translates to:
  /// **'Office'**
  String get roomOffice;

  /// No description provided for @roomLiving.
  ///
  /// In en, this message translates to:
  /// **'Living Room'**
  String get roomLiving;

  /// No description provided for @roomKitchen.
  ///
  /// In en, this message translates to:
  /// **'Kitchen'**
  String get roomKitchen;

  /// No description provided for @roomEntrance.
  ///
  /// In en, this message translates to:
  /// **'Entrance'**
  String get roomEntrance;

  /// No description provided for @roomBathroom.
  ///
  /// In en, this message translates to:
  /// **'Bathroom'**
  String get roomBathroom;

  /// No description provided for @readyToAnalyze.
  ///
  /// In en, this message translates to:
  /// **'Ready to analyze your space?'**
  String get readyToAnalyze;

  /// No description provided for @readyToAnalyzeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Upload a photo and get an AI-powered Feng Shui assessment.'**
  String get readyToAnalyzeSubtitle;

  /// No description provided for @startAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Start Analysis'**
  String get startAnalysis;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String settingsVersion(String version);

  /// No description provided for @settingsRulesCount.
  ///
  /// In en, this message translates to:
  /// **'Feng Shui knowledge base with {count}+ verified rules'**
  String settingsRulesCount(int count);

  /// No description provided for @settingsPoweredBy.
  ///
  /// In en, this message translates to:
  /// **'Powered by Gemini Vision AI'**
  String get settingsPoweredBy;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Please check your network.'**
  String get errorNetwork;

  /// No description provided for @errorRateLimit.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Please wait a moment.'**
  String get errorRateLimit;

  /// No description provided for @errorInvalidImage.
  ///
  /// In en, this message translates to:
  /// **'Invalid image. Please use JPEG, PNG, or WebP.'**
  String get errorInvalidImage;

  /// No description provided for @errorImageTooLarge.
  ///
  /// In en, this message translates to:
  /// **'Image is too large. Maximum size is 10 MB.'**
  String get errorImageTooLarge;

  /// No description provided for @errorAnalysisFailed.
  ///
  /// In en, this message translates to:
  /// **'Analysis failed. Please try again.'**
  String get errorAnalysisFailed;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageTurkish.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get languageTurkish;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
