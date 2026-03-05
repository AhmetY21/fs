import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    required this.onSourceSelected,
    required this.onRemove,
    this.imageFile,
    this.isDisabled = false,
    super.key,
  });

  final File? imageFile;
  final void Function(ImageSource source) onSourceSelected;
  final VoidCallback onRemove;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (imageFile != null) {
      return _PreviewView(
        imageFile: imageFile!,
        onRemove: onRemove,
        isDisabled: isDisabled,
      );
    }

    return _PlaceholderView(
      l10n: l10n,
      onSourceSelected: onSourceSelected,
      isDisabled: isDisabled,
    );
  }
}

class _PlaceholderView extends StatelessWidget {
  const _PlaceholderView({
    required this.l10n,
    required this.onSourceSelected,
    required this.isDisabled,
  });

  final AppLocalizations l10n;
  final void Function(ImageSource source) onSourceSelected;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.bgGlass,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.borderSubtle,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add_photo_alternate_outlined,
            size: 64,
            color: AppColors.textMuted.withValues(alpha: 0.6),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.uploadPlaceholder,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.uploadFormats,
            style: AppTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SourceButton(
                icon: Icons.camera_alt_outlined,
                label: l10n.uploadCamera,
                onPressed: isDisabled
                    ? null
                    : () => onSourceSelected(ImageSource.camera),
              ),
              const SizedBox(width: 16),
              _SourceButton(
                icon: Icons.photo_library_outlined,
                label: l10n.uploadGallery,
                onPressed: isDisabled
                    ? null
                    : () => onSourceSelected(ImageSource.gallery),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SourceButton extends StatelessWidget {
  const _SourceButton({
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.accentGold,
        side: const BorderSide(color: AppColors.borderAccent),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class _PreviewView extends StatelessWidget {
  const _PreviewView({
    required this.imageFile,
    required this.onRemove,
    required this.isDisabled,
  });

  final File imageFile;
  final VoidCallback onRemove;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.file(
              imageFile,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      imageFile.path.split('/').last,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: isDisabled ? null : onRemove,
                    icon: const Icon(Icons.close, size: 16),
                    label: Text(l10n.uploadRemove),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.accentRed,
                      textStyle: AppTextStyles.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
