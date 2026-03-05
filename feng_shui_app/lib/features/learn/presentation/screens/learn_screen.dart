import 'package:flutter/material.dart';
import 'package:feng_shui_app/core/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../router/app_router.dart';
import '../widgets/bagua_grid_widget.dart';
import '../widgets/element_card_widget.dart';
import '../widgets/learn_section_widget.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            _Hero(l10n: l10n),
            const SizedBox(height: 24),
            _ChiSection(l10n: l10n),
            _CommandSection(l10n: l10n),
            _ElementsSection(l10n: l10n),
            _BaguaSection(l10n: l10n),
            _ShaChiSection(l10n: l10n),
            _RoomTipsSection(l10n: l10n),
            _CtaSection(l10n: l10n),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('🏯', style: TextStyle(fontSize: 48)),
        const SizedBox(height: 12),
        Text(
          l10n.learnTitle,
          style: AppTextStyles.displayLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          l10n.learnSubtitle,
          style: AppTextStyles.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ChiSection extends StatelessWidget {
  const _ChiSection({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return LearnSectionWidget(
      badge: l10n.learnChiBadge,
      title: l10n.learnChiTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.learnChiBody,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          ConceptCard(
            title: '✅ ${l10n.learnChiGoodTitle}',
            accentColor: AppColors.gradeAPlus,
            items: [
              l10n.learnChiGood1,
              l10n.learnChiGood2,
              l10n.learnChiGood3,
              l10n.learnChiGood4,
              l10n.learnChiGood5,
            ],
          ),
          const SizedBox(height: 12),
          ConceptCard(
            title: '❌ ${l10n.learnChiBlockedTitle}',
            accentColor: AppColors.accentRed,
            items: [
              l10n.learnChiBlocked1,
              l10n.learnChiBlocked2,
              l10n.learnChiBlocked3,
              l10n.learnChiBlocked4,
              l10n.learnChiBlocked5,
            ],
          ),
          const SizedBox(height: 12),
          ConceptCard(
            title: '⚡ ${l10n.learnChiShaTitle}',
            accentColor: AppColors.accentRed,
            items: [
              l10n.learnChiSha1,
              l10n.learnChiSha2,
              l10n.learnChiSha3,
              l10n.learnChiSha4,
              l10n.learnChiSha5,
            ],
          ),
        ],
      ),
    );
  }
}

class _CommandSection extends StatelessWidget {
  const _CommandSection({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return LearnSectionWidget(
      badge: l10n.learnCommandBadge,
      title: l10n.learnCommandTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.learnCommandBody,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.accentGold.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.accentGold.withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Three Rules:',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.accentGold,
                  ),
                ),
                const SizedBox(height: 12),
                _NumberedRule(number: '1', text: l10n.learnCommandRule1),
                _NumberedRule(number: '2', text: l10n.learnCommandRule2),
                _NumberedRule(number: '3', text: l10n.learnCommandRule3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NumberedRule extends StatelessWidget {
  const _NumberedRule({required this.number, required this.text});
  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accentGold.withValues(alpha: 0.2),
            ),
            alignment: Alignment.center,
            child: Text(
              number,
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.accentGold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ElementsSection extends StatelessWidget {
  const _ElementsSection({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return LearnSectionWidget(
      badge: l10n.learnElementsBadge,
      title: l10n.learnElementsTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.learnElementsBody,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          ElementCardWidget(
            emoji: '🌿',
            name: l10n.elementWood,
            accentColor: const Color(0xFF4CAF50),
            details: {
              l10n.elementColors: l10n.woodColors,
              l10n.elementShapes: l10n.woodShapes,
              l10n.elementDirection: l10n.woodDirection,
              l10n.elementRepresents: l10n.woodRepresents,
              l10n.elementMaterials: l10n.woodMaterials,
            },
          ),
          const SizedBox(height: 10),
          ElementCardWidget(
            emoji: '🔥',
            name: l10n.elementFire,
            accentColor: const Color(0xFFE74C3C),
            details: {
              l10n.elementColors: l10n.fireColors,
              l10n.elementShapes: l10n.fireShapes,
              l10n.elementDirection: l10n.fireDirection,
              l10n.elementRepresents: l10n.fireRepresents,
              l10n.elementMaterials: l10n.fireMaterials,
            },
          ),
          const SizedBox(height: 10),
          ElementCardWidget(
            emoji: '🏔️',
            name: l10n.elementEarth,
            accentColor: const Color(0xFFFFC107),
            details: {
              l10n.elementColors: l10n.earthColors,
              l10n.elementShapes: l10n.earthShapes,
              l10n.elementDirection: l10n.earthDirection,
              l10n.elementRepresents: l10n.earthRepresents,
              l10n.elementMaterials: l10n.earthMaterials,
            },
          ),
          const SizedBox(height: 10),
          ElementCardWidget(
            emoji: '⚙️',
            name: l10n.elementMetal,
            accentColor: const Color(0xFFBDBDBD),
            details: {
              l10n.elementColors: l10n.metalColors,
              l10n.elementShapes: l10n.metalShapes,
              l10n.elementDirection: l10n.metalDirection,
              l10n.elementRepresents: l10n.metalRepresents,
              l10n.elementMaterials: l10n.metalMaterials,
            },
          ),
          const SizedBox(height: 10),
          ElementCardWidget(
            emoji: '💧',
            name: l10n.elementWater,
            accentColor: const Color(0xFF2196F3),
            details: {
              l10n.elementColors: l10n.waterColors,
              l10n.elementShapes: l10n.waterShapes,
              l10n.elementDirection: l10n.waterDirection,
              l10n.elementRepresents: l10n.waterRepresents,
              l10n.elementMaterials: l10n.waterMaterials,
            },
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.accentJade.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '🔄 ${l10n.learnElementsCycle}',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.accentJade,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _BaguaSection extends StatelessWidget {
  const _BaguaSection({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return LearnSectionWidget(
      badge: l10n.learnBaguaBadge,
      title: l10n.learnBaguaTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.learnBaguaBody,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          const BaguaGridWidget(),
          const SizedBox(height: 8),
          Text(
            '↑ Front door / entrance wall at bottom ↑',
            style: AppTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ShaChiSection extends StatelessWidget {
  const _ShaChiSection({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return LearnSectionWidget(
      badge: l10n.learnShaChiBadge,
      title: l10n.learnShaChiTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.learnShaChiBody,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          ShaChiCard(
            emoji: '🗡️',
            title: l10n.shaPoisonArrows,
            description: l10n.shaPoisonArrowsDesc,
          ),
          const SizedBox(height: 10),
          ShaChiCard(
            emoji: '📏',
            title: l10n.shaCorridors,
            description: l10n.shaCorridorsDesc,
          ),
          const SizedBox(height: 10),
          ShaChiCard(
            emoji: '🪵',
            title: l10n.shaBeams,
            description: l10n.shaBeamsDesc,
          ),
          const SizedBox(height: 10),
          ShaChiCard(
            emoji: '🪞',
            title: l10n.shaMirror,
            description: l10n.shaMirrorDesc,
          ),
        ],
      ),
    );
  }
}

class _RoomTipsSection extends StatelessWidget {
  const _RoomTipsSection({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return LearnSectionWidget(
      badge: l10n.learnRoomTipsBadge,
      title: l10n.learnRoomTipsTitle,
      child: Column(
        children: [
          RoomTipCard(
            emoji: '🛏️',
            title: l10n.roomBedroom,
            tips: const [
              'Bed in Command Position',
              'Solid headboard against wall',
              'No mirrors facing the bed',
              'Matched nightstands for balance',
              'Soft, calming colors',
              'No electronics near the bed',
            ],
          ),
          const SizedBox(height: 10),
          RoomTipCard(
            emoji: '💼',
            title: l10n.roomOffice,
            tips: const [
              'Desk in Command Position',
              'Wall behind your back',
              'Never sit facing a wall',
              'Keep desk organized',
              'Add a plant for Wood energy',
              'Good task lighting',
            ],
          ),
          const SizedBox(height: 10),
          RoomTipCard(
            emoji: '🛋️',
            title: l10n.roomLiving,
            tips: const [
              'Main sofa against a wall',
              'Seating faces the entrance',
              'Clear pathways for chi flow',
              'Soften sharp coffee table corners',
              'Balance all five elements',
              'Use layered lighting',
            ],
          ),
          const SizedBox(height: 10),
          RoomTipCard(
            emoji: '🍳',
            title: l10n.roomKitchen,
            tips: const [
              'See the door while cooking',
              'Separate stove (fire) and sink (water)',
              'Keep stove clean and working',
              'Use all burners equally',
              'Fresh fruits as Wood element',
              'Bright, clean energy',
            ],
          ),
          const SizedBox(height: 10),
          RoomTipCard(
            emoji: '🚪',
            title: l10n.roomEntrance,
            tips: const [
              'Clear, uncluttered entryway',
              'Good lighting at the door',
              'No mirror directly facing door',
              'Welcoming mat or plant',
              'Door opens fully',
              'House number clearly visible',
            ],
          ),
          const SizedBox(height: 10),
          RoomTipCard(
            emoji: '🚿',
            title: l10n.roomBathroom,
            tips: const [
              'Keep toilet lid closed',
              'Keep bathroom door closed',
              'Add Earth elements (ceramics)',
              'Fresh towels and plants',
              'Fix any leaks immediately',
              'Good ventilation',
            ],
          ),
        ],
      ),
    );
  }
}

class _CtaSection extends StatelessWidget {
  const _CtaSection({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.accentGold.withValues(alpha: 0.1),
            AppColors.accentJade.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderAccent),
      ),
      child: Column(
        children: [
          Text(
            l10n.readyToAnalyze,
            style: AppTextStyles.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.readyToAnalyzeSubtitle,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go(AppRoutes.analysis),
            child: Text('☯ ${l10n.startAnalysis}'),
          ),
        ],
      ),
    );
  }
}
