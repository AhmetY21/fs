import 'package:flutter/material.dart';
import 'package:feng_shui_app/core/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/fengshui_rules.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../analysis/presentation/widgets/glass_card.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            Text(l10n.settingsTitle, style: AppTextStyles.displaySmall),
            const SizedBox(height: 24),

            // Language section
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.language,
                        color: AppColors.accentGold,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(l10n.settingsLanguage, style: AppTextStyles.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _LanguageOption(
                    label: l10n.languageEnglish,
                    locale: const Locale('en'),
                    isSelected: _isSelected(currentLocale, 'en', context),
                    onTap: () => ref
                        .read(localeProvider.notifier)
                        .setLocale(const Locale('en')),
                  ),
                  const SizedBox(height: 8),
                  _LanguageOption(
                    label: l10n.languageTurkish,
                    locale: const Locale('tr'),
                    isSelected: _isSelected(currentLocale, 'tr', context),
                    onTap: () => ref
                        .read(localeProvider.notifier)
                        .setLocale(const Locale('tr')),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // About section
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: AppColors.accentJade,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(l10n.settingsAbout, style: AppTextStyles.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _AboutRow(
                    icon: Icons.auto_fix_high,
                    text: l10n.settingsPoweredBy,
                  ),
                  const SizedBox(height: 10),
                  _AboutRow(
                    icon: Icons.library_books,
                    text: l10n.settingsRulesCount(FengShuiData.rules.length),
                  ),
                  const SizedBox(height: 10),
                  _AboutRow(
                    icon: Icons.tag,
                    text: l10n.settingsVersion('1.0.0'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isSelected(Locale? current, String code, BuildContext context) {
    if (current != null) return current.languageCode == code;
    return Localizations.localeOf(context).languageCode == code;
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.label,
    required this.locale,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final Locale locale;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accentGold.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? AppColors.accentGold.withValues(alpha: 0.4)
                : AppColors.borderSubtle,
          ),
        ),
        child: Row(
          children: [
            Text(
              _flagEmoji(locale.languageCode),
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: AppTextStyles.bodyLarge.copyWith(
                color: isSelected
                    ? AppColors.accentGold
                    : AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
            const Spacer(),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: AppColors.accentGold,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }

  String _flagEmoji(String code) {
    return switch (code) {
      'en' => '🇺🇸',
      'tr' => '🇹🇷',
      _ => '🌐',
    };
  }
}

class _AboutRow extends StatelessWidget {
  const _AboutRow({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textMuted),
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
    );
  }
}
